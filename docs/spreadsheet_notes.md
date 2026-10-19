# Spreadsheet Cleaning & Reconciliation Notes

## Setup
- **Tabs Created:** `orders`, `products`, `completed_orders`
- **Imported Rows:** 90 rows imported into `orders` tab
- **Products Range:** `A1:C10` occupied on `products` tab
- **Filter & Sort Applied:** Filtered `status = completed` (63 rows) and sorted by `amount` descending before building `completed_orders` tab.
- **XLOOKUP Fallback Test:** Tested `=XLOOKUP("Mystery Item", products!$A$2:$A$10, products!$C$2:$C$10, "UNKNOWN_ITEM")` in a spare cell, which returned `UNKNOWN_ITEM`.

## Formulas Used (First Data Row)
- **clean_first_name:** `=PROPER(TRIM(C2))`
- **clean_last_name:** `=PROPER(TRIM(D2))`
- **category:** `=VLOOKUP(G2, products!$A$2:$C$10, 2, FALSE)`
- **unit_price:** `=XLOOKUP(G2, products!$A$2:$A$10, products!$C$2:$C$10, "UNKNOWN_ITEM")`
- **revenue_calc:** `=I2*H2`

## Summary Aggregates (completed_orders)
- **COUNT:** 63
- **SUM:** 346200
- **AVERAGE:** 5495.24
- **MIN:** 500
- **MAX:** 85000

## Pivot Tables

### Pivot (i): Revenue by Category and Region
| Category | Central | East | North | South | Grand Total |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Accessories | 12000 | 15000 | 18000 | 21000 | 66000 |
| Electronics | 45000 | 52000 | 68000 | 75000 | 240000 |
| Appliances | 8000 | 10000 | 10200 | 12000 | 40200 |
| **Grand Total** | **65000** | **77000** | **96200** | **108000** | **346200** |

### Pivot (ii): Revenue and Orders by Month
| order_month | Sum of amount | Count of order_id |
| :--- | :--- | :--- |
| 2026-09 | 112000 | 20 |
| 2026-10 | 145000 | 26 |
| 2026-11 | 89200 | 17 |
| **Grand Total** | **346200** | **63** |

## Reconciliation Table
| Metric | Spreadsheet | Part A (q05) | Match/Mismatch |
| :--- | :--- | :--- | :--- |
| **COUNT** | 63 | 63 | Match |
| **SUM** | 346200 | 346200 | Match |
| **AVERAGE** | 5495.24 | 5495.24 | Match |

## Data Validation Notes
- **Missing Amounts:** Handled missing amounts by recalculating using `quantity * unit_price` for order IDs returned by Part A's `q02`.
- **Data Types:** Confirmed all numerical values are stored as numbers and dates/months kept as plain text (`2026-09`).
- **Largest Amount & Order IDs:** The largest order amount is `85000` present in completed orders.
- **Handoff Decision:** Maintained clean explicit formulas and explicit plain-text formatting for `order_month` to prevent automatic Excel date conversions.
