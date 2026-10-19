# AI-Assisted Analysis with Human-in-the-Loop Verification Log

## Task 1: Five-Part Structured Prompt for Part A Query q13

- **Role:** Senior Data Analyst specializing in SQL-based sales performance analytics.
- **Task:** Write an ANSI SQL query to rank regions based on sales performance and classify them into performance tiers based on total revenue.
- **Context:** Work with MySQL dialect using the schema tables `reps` (rep_id, rep_name, region_name), `customers` (customer_id, first_name, last_name, region_name), and `orders` (order_id, order_month, rep_id, customer_id, item, quantity, amount, status).
- **Constraints:** Filter for `status = 'completed'` orders only. Apply tier thresholds: 'Top Region' for revenue >= 100,000, 'Mid Region' for revenue between 70,000 and 99,999, and 'Lower Region' for revenue < 70,000. Do not use CTEs (`WITH` clauses) or stored procedures.
- **Format:** Output raw executable SQL code only with inline explanatory comments.

---

## Task 2: Defect Inspection for Scenario D1

| Defect / Issue | Defect Classification | Correct Clause / Repair Fix |
| :--- | :--- | :--- |
| Table `sales` does not exist | `fake method/function` | Join `orders o` with `reps r` on `o.rep_id = r.rep_id` |
| Columns `region_name` and `total_sales` in `sales` do not exist | `fake method/function` | Use `r.region_name` and `o.amount` |
| Aggregating `SUM(total_sales) > 80000` in `WHERE` clause | `logic error` | Move aggregated filtering to `HAVING SUM(o.amount) > 80000` |
| Claiming "North is the strongest region, and its revenue grew 38% month over month" | `phantom statistic` | Real data shows South is the top region (108,000) and North's revenue declined by **-22.8%** from 2026-09 to 2026-10 |

---

## Task 3: Verification of Scenario D1

### Corrected Query Result (`sql/d1_corrected.sql`)
Running the corrected query against the database returns exactly 2 rows:
| region_name | sales |
| :--- | :--- |
| South | 108000 |
| North | 119300 |

*(Note: Total completed revenue for South is 108,000 and North is 119,300 across all seed orders).*

### North's Actual Month-over-Month Revenue Calculation
- North Revenue in `2026-09`: **57,000**
- North Revenue in `2026-10`: **44,000**
- Actual MoM % Change = `((44000 - 57000) / 57000) * 100` = **-22.8%**

*Conclusion:* The AI assistant's claim of 38% growth is directly contradicted by the actual data, which proves a -22.8% decline.

---

## Task 4: Human-in-the-Loop Protocol Execution

- **Specification:** Provided the assistant with a business context to analyze regional sales rankings with a 80,000 threshold.
- **Execution:** Received the AI output containing SQL syntax errors and an unchecked narrative claim regarding North's MoM growth.
- **Inspection:** Identified synthetic table/column names, improper placement of aggregate functions in the `WHERE` clause, and unverified narrative statistics.
- **Verification:** Corrected the SQL query against the real schema and verified actual monthly regional totals using SQL results from `q11`.
- **Decision:** **REJECT** the original AI answer due to invalid SQL execution errors and false phantom statistics (38% growth claim). **ACCEPT** the corrected version based on empirical SQL execution returning South (108,000) and North (119,300) with verified MoM change (-22.8%).

---

## Task 5: Scenario D2 Prompt, Root Cause & Repair

### Five-Part Prompt for Scenario D2
- **Role:** Spreadsheet & Excel Specialist.
- **Task:** Troubleshoot a `#N/A` lookup error in a VLOOKUP formula.
- **Context:** In tab `orders`, cell `G2` contains `" Smart Watch"` (item name). Tab `products` range `A1:C10` contains item names in column A and unit prices in column C.
- **Constraints:** Explain why `=VLOOKUP(G2, $A$2:$C$10, 3, FALSE)` fails and provide a robust repaired formula.
- **Format:** Plain text explanation followed by the exact corrected formula code.

### Root Cause Analysis
The formula returns a `#N/A` error because cell `G2` contains a leading space (`" Smart Watch"`), which prevents an exact match against `"Smart Watch"` in the lookup range `A2:A10`.

### Repaired Formula
```excel
=VLOOKUP(TRIM(G2), products!$A$2:$C$10, 3, FALSE)
