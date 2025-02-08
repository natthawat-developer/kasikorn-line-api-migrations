# Kasikorn Line API Migrations

## Overview
This project manages database migrations for the Kasikorn Line API using `golang-migrate`. It helps to apply and rollback database schema changes effectively.

## Project Structure
```
kasikorn-line-api-migrations
├─ README.md
├─ cmd
│  └─ main.go
├─ config
│  └─ config.go
├─ config.yaml
├─ go.mod
├─ go.sum
├─ migrations
│  ├─ 202502081200_create_accounts_tables.down.sql
│  ├─ 202502081200_create_accounts_tables.up.sql
│  ├─ 202502081500_create_banners_table.down.sql
│  ├─ 202502081500_create_banners_table.up.sql
│  ├─ 202502081600_create_debit_card_tables.down.sql
│  ├─ 202502081600_create_debit_card_tables.up.sql
│  ├─ 202502081700_create_transactions_table.down.sql
│  ├─ 202502081700_create_transactions_table.up.sql
│  ├─ 202502081800_create_users_and_user_greetings_tables.down.sql
│  └─ 202502081800_create_users_and_user_greetings_tables.up.sql
└─ pkg
   ├─ database
   │  └─ database.go
   ├─ error
   │  └─ error.go
   ├─ health
   │  └─ health.go
   ├─ log
   │  └─ logger.go
   ├─ security
   │  ├─ cors.go
   │  ├─ helmet.go
   │  └─ ratelimit.go
   ├─ utils
   │  ├─ masking.go
   │  └─ masking_test.go
   └─ validator
      └─ validator.go

```

## Prerequisites
- Go 1.20+
- MySQL database
- `golang-migrate`

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/kasikorn-line-api-migrations.git
   cd kasikorn-line-api-migrations
   ```
2. Install dependencies:
   ```sh
   go mod tidy
   ```

## Configuration
Modify the `config.yaml` file with your database credentials:
```yaml
db:
  user: "your_user"
  password: "your_password"
  host: "localhost"
  port: 3306
  name: "your_database"
```

## Usage
### Run Migrations
To apply the latest migrations, run:
```sh
go run cmd/main.go migrate
```

### Rollback Migrations
To rollback the latest migration, run:
```sh
go run cmd/main.go rollback
```

## License
This project is licensed under the MIT License.