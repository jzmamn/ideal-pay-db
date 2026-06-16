# ideal-pay-db — MySQL Database

## Overview
Holds MySQL dump files (full schema + data) for the `ideal_pay` database, plus utility scripts and seed data. **No Flyway** — schema is managed via manual SQL dumps.

## Database
- **Engine**: MySQL 8.0
- **Database name**: `ideal_pay`
- **Charset**: `utf8mb4` / `utf8mb4_0900_ai_ci`
- **Local dev connection**: `localhost:3306`, user `root`, password `1234`

## Folder Structure
```
ideal-pay-db/
├── ideal-pay-db_<date>.sql        # Full schema + data dump (restore point)
├── lg-db_<date>.sql               # License generator DB dump
├── tools/
│   ├── initial_setup/
│   │   ├── seed_default_values.txt  # INSERT statements for default rows (id = -1)
│   │   ├── country_list.sql         # Country reference data
│   │   ├── sp_tool_reset_all_tables.sql
│   │   └── sp_tool_missing_default_row.sql
│   ├── usefull/
│   │   └── sp_setup_add_is_active_column_to_all_tables.sql
│   ├── truncate_non_con_tables.sql
│   ├── truncate_script.txt
│   └── pivot-queries.txt
```

## Schema Conventions

### Common Columns (all tables)
| Column | Type | Notes |
|--------|------|-------|
| `id` | `BIGINT AUTO_INCREMENT` | Primary key |
| `code` | `VARCHAR(10–20)` | Unique, system-generated |
| `is_active` | `CHAR(1) DEFAULT 'Y'` | `'Y'` = active, `'N'` = inactive |
| `created_by` | `BIGINT` FK → `usr.id` | Audit: creator |
| `created_date` | `TIMESTAMP DEFAULT CURRENT_TIMESTAMP` | |
| `modified_by` | `BIGINT` FK → `usr.id` | Audit: last modifier |
| `modified_date` | `TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP` | |

### Default Rows
Every table has a sentinel row at `id = -1`, `code = 'DEFAULT'`. This is required for FK integrity and system defaults. **Never delete these rows.**

Seed script: `tools/initial_setup/seed_default_values.txt`

### Key Tables
| Table | Purpose |
|-------|---------|
| `usr` | System users (login accounts) |
| `user_role` | Roles assigned to users |
| `employee` | Employee master data |
| `payroll_period` | Payroll processing periods |
| `emp_payroll_run` | Payroll run header per period |
| `emp_payroll_run_detail` | Line-level payroll calculation results |
| `fixed_allowance` / `fixed_deduction` | Company-level fixed components |
| `employee_fixed_allowance` / `employee_fixed_deduction` | Employee-level assignments |
| `variable_allowance` / `variable_deduction` | Variable components |
| `employee_variable_allowance` / `employee_variable_deduction` | Variable component per employee |
| `nopay` / `employee_nopay` | No-pay rules and employee no-pay entries |
| `overtime` / `employee_overtime` | Overtime types and entries |
| `loan` / `employee_loan` | Loan definitions and assignments |
| `bank` / `bank_branch` | Bank and branch reference data |
| `bank_transfer_template` | Templates for bank file export |
| `payslip_template` | HTML payslip templates |
| `email_config` / `email_template` | Email configuration and templates |
| `import_session` / `import_log` | Staged import tracking |
| `gratuity_config` / `emp_gratuity` | Gratuity configuration and calculations |
| `salary_increment` | Salary increment batches |
| `branch` / `department` / `designation` / `grade` / `job_category` | Org structure |
| `company` | Company settings |
| `system_setup` | System-wide configuration |

## How to Restore
```sql
-- In MySQL client or Workbench:
CREATE DATABASE IF NOT EXISTS ideal_pay;
USE ideal_pay;
SOURCE ideal-pay-db_<date>.sql;
```
Then run seed defaults if starting fresh:
```sql
SOURCE tools/initial_setup/seed_default_values.txt;
```

## Dump Naming Convention
`ideal-pay-db_YYYY-MM-DD.sql` — date of the dump.
Multiple dumps on the same day use a `_1`, `_2` suffix.

## Adding a New Table
1. Write `CREATE TABLE` SQL following the common-columns convention above.
2. Insert a default row (`id = -1`).
3. Add corresponding entity, repository, service, and controller in `ideal-pay-be`.
4. Take a new dump and commit it to this repo.
