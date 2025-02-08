package main

import (
	"fmt"
	"os"

	"github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/mysql"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/spf13/cobra"
	"kasikorn-line-api-migrations/config"
	logger "kasikorn-line-api-migrations/pkg/log"
)

func createMigrateInstance() (*migrate.Migrate, error) {

	appConfig := config.LoadConfig()

	dbURL := fmt.Sprintf("mysql://%s:%s@tcp(%s:%d)/%s?multiStatements=true",
		appConfig.DB.User,
		appConfig.DB.Password,
		appConfig.DB.Host,
		appConfig.DB.Port,
		appConfig.DB.Name,
	)

	migrationsPath := "file://migrations/"

	return migrate.New(migrationsPath, dbURL)
}

func runMigration(direction string) {
	m, err := createMigrateInstance()
	if err != nil {
		logger.Fatal("❌ Failed to create migrate instance")
	}
	defer m.Close()

	var migrationErr error
	if direction == "up" {
		migrationErr = m.Up()
	} else if direction == "down" {
		migrationErr = m.Down()
	}

	if migrationErr != nil && migrationErr != migrate.ErrNoChange {
		logger.Fatal("❌ Migration failed")
	} else {
		if direction == "up" {
			logger.Info("✅ Database migration completed successfully!")
		} else {
			logger.Info("✅ Rollback completed (or no changes detected)")
		}
	}
}

func main() {
	var cmdMigrate = &cobra.Command{
		Use:   "migrate",
		Short: "Run database migrations",
		Run: func(cmd *cobra.Command, args []string) {
			runMigration("up")
		},
	}

	var cmdRollback = &cobra.Command{
		Use:   "rollback",
		Short: "Rollback database migrations",
		Run: func(cmd *cobra.Command, args []string) {
			runMigration("down")
		},
	}

	var rootCmd = &cobra.Command{Use: "db"}
	rootCmd.AddCommand(cmdMigrate)
	rootCmd.AddCommand(cmdRollback)

	if err := rootCmd.Execute(); err != nil {
		fmt.Println("Error:", err)
		os.Exit(1)
	}
}
