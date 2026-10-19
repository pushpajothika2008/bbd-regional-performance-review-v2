# Dashboard Specification and Business Narrative

## Data Source
Connected to `data/orders_clean.csv`. Below is the classification of all 13 columns as Dimensions or Measures:

| Column Name | Classification |
| :--- | :--- |
| `order_id` | Dimension |
| `order_month` | Dimension |
| `clean_first_name` | Dimension |
| `clean_last_name` | Dimension |
| `region` | Dimension |
| `rep_name` | Dimension |
| `item` | Dimension |
| `category` | Dimension |
| `unit_price` | Measure |
| `quantity` | Measure |
| `amount` | Measure |
| `revenue_calc` | Measure |
| `status` | Dimension |

---

## KPI Cards
1. **Total Revenue:** Sum of `amount` = **346,200**
2. **Total Units Sold:** Sum of `quantity` = **105**

*Confirmation:* The Total Revenue KPI value of 346,200 exactly equals Part A's q05 `total_revenue`.

---

## Chart Sheets

### 1. Revenue by Region (Bar Chart)
- **Chart Type:** Horizontal Bar Chart
- **Columns:** Sum(`amount`)
- **Rows:** `region`
- **Color Shelf:** `region`
- **Reason:** A horizontal bar chart allows for quick visual comparison of total revenue generated across discrete geographical regions.
- **Data Table:**
  | Region | Revenue |
  | :--- | :--- |
  | South | 108,000 |
  | North | 96,200 |
  | East | 77,000 |
  | Central | 65,000 |

### 2. Revenue by Category (Bar Chart)
- **Chart Type:** Vertical Bar Chart
- **Columns:** `category`
- **Rows:** Sum(`amount`)
- **Color Shelf:** `category`
- **Reason:** Vertical bar charts effectively highlight performance disparities across product categories.
- **Data Table:**
  | Category | Revenue |
  | :--- | :--- |
  | Electronics | 240,000 |
  | Accessories | 66,000 |
  | Appliances | 40,200 |

### 3. Revenue Trend by Month and Category (Line Chart)
- **Chart Type:** Multi-Line Chart
- **Columns:** `order_month`
- **Rows:** Sum(`amount`)
- **Color Shelf:** `category`
- **Reason:** A multi-line chart shows monthly performance trajectory and identifies category-wise seasonal trends over time.
- **Data Table:**
  | order_month | Category | Revenue |
  | :--- | :--- | :--- |
  | 2026-09 | Electronics | 80,000 |
  | 2026-09 | Accessories | 20,000 |
  | 2026-09 | Appliances | 12,000 |
  | 2026-10 | Electronics | 100,000 |
  | 2026-10 | Accessories | 28,000 |
  | 2026-10 | Appliances | 17,000 |
  | 2026-11 | Electronics | 60,000 |
  | 2026-11 | Accessories | 18,000 |
  | 2026-11 | Appliances | 11,200 |

### 4. Region x Category Detail (Text Table)
- **Chart Type:** Cross-tab / Text Table
- **Columns:** `region`
- **Rows:** `category`
- **Color Shelf:** None (Text/Values)
- **Reason:** A matrix text table provides precise numerical figures for drill-down analysis across region-category pairs.
- **Data Table:**
  | Category | Central | East | North | South |
  | :--- | :--- | :--- | :--- | :--- |
  | Accessories | 12,000 | 15,000 | 18,000 | 21,000 |
  | Electronics | 45,000 | 52,000 | 68,000 | 75,000 |
  | Appliances | 8,000 | 10,000 | 10,200 | 12,000 |

---

## Dashboard Layout
- **Placement Order (Top to Bottom):**
  1. Header / KPI Cards Band (Total Revenue & Total Units Sold side-by-side)
  2. Category Filter Band (Global filter placed directly below KPI cards)
  3. Revenue Trend Chart (Line Chart)
  4. Comparison Charts (Revenue by Region and Revenue by Category placed horizontally side-by-side)
  5. Region x Category Detail Table (Text Table at the bottom)
- **Containers Used:** Outer Vertical Container containing two Top Horizontal Containers (KPIs & Filter), one Middle Vertical Container (Trend line chart), one Lower Horizontal Container (Region & Category bar charts), and one Bottom Vertical Container (Detail table).
- **Global Filter Behavior:** The `category` filter in the top band is configured to apply to all 4 worksheets using this data source.
- **Interactive Action Behavior:** When a user clicks a bar in *Revenue by Region* with "Use as Filter" activated, all other worksheets on the dashboard immediately filter to show data exclusively for that selected region.

---

## Insight and Recommendation Narrative

### Visualization Summary
The dashboard delivers a comprehensive regional performance overview across product categories and timeline intervals. It highlights revenue distribution across four geographic regions (South, North, East, Central) and three main product categories (Electronics, Accessories, Appliances) across three target months (2026-09, 2026-10, 2026-11).

### Summary Analysis
1. **Regional Comparison:** The South region leads all performance metrics with 108,000 in revenue, outperforming Central, which recorded the lowest regional revenue at 65,000.
2. **Category Dominance:** Electronics generated 240,000 in revenue, accounting for nearly 69.3% of total sales across all categories.
3. **Monthly Trend Change:** Total revenue surged to its peak in 2026-10 (145,000 total across categories) before declining in 2026-11 down to 89,200.

### Recommendations
1. **Promotional Push in Central Region:** Reallocate promotional budgets to the Central region targeting Electronics (currently at 45,000), aiming to increase regional revenue closer to the South's benchmark of 75,000. Metric to watch: Monthly Central region Electronics revenue growth.
2. **Stock Optimization for Peak Months:** Expand stock inventory ahead of October based on the 2026-10 revenue spike (145,000 total revenue) to prevent stockouts in high-demand categories like Electronics (100,000 in October). Metric to watch: Stockout rates during peak monthly sales.
3. **Category Expansion in Appliances:** Launch targeted bundled offers for Appliances in the North region (currently generating 10,200) to cross-sell with strong-performing Electronics. Metric to watch: Appliances sales conversion rate in North.

---

## Reconciliation Table

| Metric / Source | Value | Match Status |
| :--- | :--- | :--- |
| **Total Revenue KPI** | 346,200 | Base Metric |
| **Sum of Revenue by Region** | 346,200 | Match |
| **Sum of Revenue by Category** | 346,200 | Match |
| **Part B Pivot Grand Total** | 346,200 | Match |

*All four revenue totals are identical and fully reconciled.*
