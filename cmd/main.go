package main

import (
	"fmt"
	"log"
	"os"

	"github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/mysql"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/spf13/cobra"
	"kasikorn-line-api-migrations/config"
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
		log.Fatal("❌ Failed to create migrate instance:", err)
	}
	defer m.Close()

	var migrationErr error
	if direction == "up" {
		migrationErr = m.Up()
	} else if direction == "down" {
		migrationErr = m.Down()
	}

	if migrationErr != nil && migrationErr != migrate.ErrNoChange {
		log.Fatal("❌ Migration failed:", migrationErr)
	} else {
		if direction == "up" {
			log.Println("✅ Database migration completed successfully!")
		} else {
			log.Println("✅ Rollback completed (or no changes detected)")
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
		log.Println("Error:", err)
		os.Exit(1)
	}
}
