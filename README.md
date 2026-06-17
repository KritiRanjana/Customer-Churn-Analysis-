# 📊 Customer Churn Analysis — Telecom Industry

An end-to-end analytics project conducted in two phases: first analyzing customer behavior in **SQL**, then building an interactive **Power BI** dashboard to identify and visualize churn drivers. The goal — understand **why customers leave a telecom company** and **how much revenue that churn costs the business**.

---

## 🎯 Business Problem

Customer churn directly erodes recurring revenue. This project analyzes a telecom customer dataset to answer three core business questions:

1. What is the overall churn rate, and which customer segments churn the most?
2. Which service, contract, and billing factors are most strongly associated with churn?
3. How much monthly revenue is the business losing due to churn, and where should retention efforts be focused first?

---

## 🛠️ Tools & Skills Used

| Tool | Purpose |
|------|---------|
| **SQL** | Data validation, KPI calculation, segmented churn analysis (18 queries) |
| **Power BI** | Interactive dashboard, DAX measures, data modeling |
| **DAX** | Custom calculated measures for churn rate, revenue impact |

---

## 📁 Dataset

- **Source:** Telco Customer Churn dataset
- **Size:** 7,043 customers, 21 attributes
- **Attributes include:** Demographics, account info (tenure, contract, payment method), services subscribed (internet, security, tech support, streaming), and churn status

---

## 🔍 Methodology

### Phase 1: Customer Behavior Analysis (SQL)
1. **Data validation** — verified row counts, checked for nulls/duplicates, confirmed churn label distribution
2. **KPI definition** — calculated overall churn rate as the baseline metric
3. **Behavioral segmentation** — wrote 18 queries to understand how customer behavior (contract type, tenure, payment method, service add-ons, demographics) relates to churn
4. **Revenue impact** — quantified monthly recurring revenue lost to churn, both overall and by contract type
5. **Business translation** — every query paired with an insight, a business interpretation, and an actionable recommendation (not just numbers)

### Phase 2: Churn Identification & Visualization (Power BI)
1. **Data modeling** — loaded and modeled the dataset in Power BI, building DAX measures for churn rate and revenue lost
2. **Dashboard build** — translated the SQL-driven findings into an interactive report, using the behavioral patterns from Phase 1 to decide which visuals and breakdowns would surface churn drivers most clearly
3. **Interactivity** — added slicers for Gender and Contract Type so churn patterns can be explored dynamically
4. **Design** — applied a consistent dark-theme color palette so high-risk segments are visually flagged at a glance

---

## 📈 Key Insights

- **Overall churn rate: 26.54%** — roughly 1 in 4 customers leaves
- **Contract type is the strongest churn driver:** Month-to-month customers churn at **42.71%**, vs. just 11.27% (one-year) and 2.83% (two-year)
- **Payment method matters:** Electronic check users churn at **45.29%**, nearly 3x the rate of automatic payment users
- **Service add-ons reduce churn significantly:** Customers without Online Security churn at 41.77% vs. 14.61% with it; similar patterns hold for Tech Support and Device Protection
- **Revenue at risk:** The business loses **$139,130/month** in recurring revenue to churn — **$120,847** of that from month-to-month customers alone

---

## 💡 Business Recommendations

- Incentivize month-to-month customers to upgrade to annual/two-year contracts
- Encourage migration from electronic check to automatic payment methods
- Bundle Online Security, Tech Support, and Device Protection into retention offers, especially for high-risk segments
- Build targeted retention programs for senior citizens and customers without partners/dependents, who churn at notably higher rates

---

## 📷 Dashboard Preview

The dashboard includes a KPI summary (Total Customers, Churned Customers, Churn Rate, Revenue Lost), interactive slicers, and six visual panels covering contract type, spending tier, online security, payment method, and tenure-based retention.

*(See `Telco_Customer_Churn_Analysis.png` in this repo for the full dashboard screenshot.)*

---

## 📂 Repository Contents

```
├── Churn_Analysis.pbix              # Power BI dashboard file
├── Telco-Customer-Churn.csv         # Raw dataset
├── Telco_churn_analysis_SQL.sql     # All SQL queries with insights & recommendations
├── Telco_Customer_Churn_Analysis.png # Dashboard screenshot
└── README.md
```

---

## 🚀 Skills Demonstrated

SQL aggregation & CASE-based segmentation · DAX measures · Power BI dashboard design · KPI definition · business storytelling · translating data into actionable recommendations

---

## 🔗 Connect

If you'd like to discuss this project or connect, feel free to reach out on LinkedIn.
