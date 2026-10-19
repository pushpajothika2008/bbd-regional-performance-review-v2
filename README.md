# Big Billion Days Regional Performance Review v2

## Project Overview
This repository contains a comprehensive data analysis, query pipeline, cleaned datasets, dashboard specification, and AI verification log for the Big Billion Days regional performance review.

## Environment Details
- **SQL Compiler & Dialect:** MySQL 8.0 (Standard SQL dialect)
- **Spreadsheet Tool:** Microsoft Excel / Google Sheets
- **Dashboard Platform:** Tableau Public (Specification-ready design)

## Executive Summary (Top 3 Findings)
1. **Regional Performance Leadership:** The South region achieved top revenue overall at 108,000, outperforming the Central region which generated 65,000.
2. **Category Concentration:** Electronics dominated sales across all regions, contributing 240,000 (69.3%) of total revenue (346,200).
3. **Monthly Sales Trajectory:** Sales peaked in October 2026 (2026-10) at 145,000 before normalizing to 89,200 in November 2026 (2026-11).

## File Index & Mapping

| File Path | Description | Project Part |
| :--- | :--- | :--- |
| `README.md` | Main project overview, environment specifications, and summary | Overview |
| `sql/00_schema_and_seed.sql` | Database schema creation and initial seed data | Part A |
| `sql/q01.sql` ... `sql/q13.sql` | SQL queries solving core analytical tasks 1 through 13 | Part A |
| `sql/d1_corrected.sql` | Corrected regional revenue query fixing AI hallucinations | Part D |
| `results/query_results.md` | Verified query execution outputs and data tables | Part A |
| `data/orders_enriched.csv` | Initial enriched dataset prior to cleaning | Part B |
| `data/orders_clean.csv` | Cleaned 13-column dataset with standardized headers | Part B |
| `docs/spreadsheet_notes.md` | Data cleaning formulas, pivot tables, and reconciliation notes | Part B |
| `docs/dashboard_spec.md` | Full Tableau dashboard layout specifications and business narrative | Part C |
| `docs/ai_log.md` | AI-assisted audit log, prompts, error fixes, and human-in-the-loop decisions | Part D |

## Key Assumptions Made
- **Order Status Filtering:** All revenue and performance aggregates consider only completed orders (`status = 'completed'`).
- **Data Reconciliation:** Missing amount calculations were derived dynamically using `quantity * unit_price`.
- **Month Identifiers:** Dates are represented as plain string identifiers in `YYYY-MM` format to avoid automated spreadsheet auto-formatting issues.
