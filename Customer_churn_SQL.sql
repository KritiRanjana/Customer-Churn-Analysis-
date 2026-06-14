-- Customer Churn Analysis Project

-- Step 1: Create Table

CREATE TABLE telco_churn (
customerID VARCHAR(50),
gender VARCHAR(20),
SeniorCitizen INT,
Partner VARCHAR(10),
Dependents VARCHAR(10),
tenure INT,
PhoneService VARCHAR(10),
MultipleLines VARCHAR(30),
InternetService VARCHAR(30),
OnlineSecurity VARCHAR(30),
OnlineBackup VARCHAR(30),
DeviceProtection VARCHAR(30),
TechSupport VARCHAR(30),
StreamingTV VARCHAR(30),
StreamingMovies VARCHAR(30),
Contract VARCHAR(30),
PaperlessBilling VARCHAR(10),
PaymentMethod VARCHAR(50),
MonthlyCharges DECIMAL(10,2),
TotalCharges VARCHAR(30),
Churn VARCHAR(10)
);

-- Data Validation

SELECT COUNT(*)
FROM telco_churn;

SELECT *
FROM telco_churn
LIMIT 5;

SELECT Churn,
COUNT(*) AS customer_count
FROM telco_churn
GROUP BY Churn;

-- KPI 1: Overall Churn Rate

SELECT
ROUND(
100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS churn_rate_percentage
FROM telco_churn;

/*
Insight:
Approximately one out of every four customers leaves the company.
Overall churn rate = 26.54%.
*/

-- Analysis 1: Contract Distribution

SELECT
Contract,
COUNT(*) AS customers
FROM telco_churn
GROUP BY Contract;

-- Analysis 2: Contract Distribution by Churn

SELECT
Contract,
Churn,
COUNT(*) AS customers
FROM telco_churn
GROUP BY Contract, Churn
ORDER BY Contract, Churn;

-- Analysis 3: Churn Rate by Contract Type

SELECT
Contract,
ROUND(
100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS churn_rate
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

/*
Insight:
Month-to-month customers have the highest churn rate (42.71%).

Business Interpretation:
Long-term contracts are strongly associated with customer retention.

Recommendation:
Encourage customers to move to annual or two-year plans.
*/

-- Analysis 4: Churn Rate by Internet Service

SELECT
InternetService,
ROUND(
100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS churn_rate
FROM telco_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;

/*
Insight:
Fiber Optic customers have the highest churn rate (41.89%).

Business Interpretation:
Fiber customers are churning at a rate significantly higher
than the company average.
*/

-- Analysis 5: Churn Rate by Customer Tenure Group

SELECT
CASE
WHEN tenure < 12 THEN 'New Customer'
WHEN tenure BETWEEN 12 AND 24 THEN 'Medium Customer'
ELSE 'Long-Term Customer'
END AS customer_group,
ROUND(
100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS churn_rate
FROM telco_churn
GROUP BY customer_group
ORDER BY churn_rate DESC;

/*
Insight:
New customers are significantly more likely to leave than
medium-term or long-term customers.
*/

-- Analysis 6: Churn Rate by Monthly Charges

SELECT
CASE
WHEN MonthlyCharges < 35 THEN 'Low Charges'
WHEN MonthlyCharges BETWEEN 35 AND 70 THEN 'Medium Charges'
ELSE 'High Charges'
END AS charge_group,
ROUND(
100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS churn_rate
FROM telco_churn
GROUP BY charge_group
ORDER BY churn_rate DESC;

/*
Insight:
High-charge customers have the highest churn rate (35.36%).

Recommendation:
Provide retention offers for high-value customers.
*/

-- Analysis 7: Churn Rate by Payment Method

SELECT
PaymentMethod,
ROUND(
100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS churn_rate
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

/*
Insight:
Electronic check customers have the highest churn rate (45.29%).

Recommendation:
Encourage customers to switch to automatic payment methods.
*/

-- Analysis 8: Churn Rate by Tech Support

SELECT
TechSupport,
ROUND(
100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS churn_rate
FROM telco_churn
GROUP BY TechSupport
ORDER BY churn_rate DESC;

/*
Insight:
Customers without Tech Support have a churn rate of 41.64%.

Customers with Tech Support have a churn rate of only 15.17%.

Recommendation:
Increase adoption of Tech Support services.
*/


-- Analysis 8: Churn Rate by Senior Citizen

SELECT
    SeniorCitizen,ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY SeniorCitizen
ORDER BY churn_rate DESC;

/*
Analysis 8: Churn Rate by Senior Citizen

Insight:
Senior citizens have a churn rate of 41.68%,
compared to 23.61% for non-senior customers.

Business Interpretation:
Senior citizens are significantly more likely
to leave the company than other customer groups.

Recommendation:
Provide simplified support channels, personalized
assistance, and retention programs targeted toward
senior customers.
*/


-- Analysis 9: Churn Rate by Paperless Billing

SELECT PaperlessBilling,ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY PaperlessBilling
ORDER BY churn_rate DESC;

/*
Analysis 9: Churn Rate by Paperless Billing

Insight:
Customers using paperless billing have a churn rate of
33.57%, compared to 16.33% for customers not using
paperless billing.

Business Interpretation:
Customers enrolled in paperless billing are associated
with higher churn rates than customers using traditional
billing methods.

Recommendation:
Investigate whether paperless billing customers overlap
with other high-risk segments such as month-to-month
contract holders and electronic check users.
*/


-- Analysis 10: Churn Rate by Online Security

SELECT OnlineSecurity,ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY OnlineSecurity
ORDER BY churn_rate DESC;

/*
Analysis 10: Churn Rate by Online Security

Insight:
Customers without Online Security have a churn rate of
41.77%, while customers with Online Security have a
churn rate of only 14.61%.

Business Interpretation:
Customers subscribed to Online Security appear to be
more engaged with the company's services and are less
likely to leave.

Recommendation:
Promote Online Security bundles and upsell security
services to high-risk customer segments.
*/


-- Analysis 11: Churn Rate by Online Backup

SELECT OnlineBackup,ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY OnlineBackup
ORDER BY churn_rate DESC;

/*
Analysis 11: Churn Rate by Online Backup

Insight:
Customers without Online Backup have a churn rate of
39.93%, compared to 21.53% for customers with Online Backup.

Business Interpretation:
Customers subscribed to Online Backup services appear
more engaged with the company's ecosystem and are less
likely to leave.

Recommendation:
Promote Online Backup as part of bundled service packages
to improve customer retention.
*/


-- Analysis 12: Churn Rate by Device Protection

SELECT DeviceProtection,ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY DeviceProtection
ORDER BY churn_rate DESC;

/*
Analysis 12: Churn Rate by Device Protection

Insight:
Customers without Device Protection have a churn rate of
39.13%, compared to 22.50% for customers with Device Protection.

Business Interpretation:
Customers who subscribe to Device Protection services
appear less likely to leave the company.

Recommendation:
Promote Device Protection bundles and educate customers
about the benefits of protecting their devices.
*/


-- Analysis 13: Churn Rate by Streaming TV

SELECT StreamingTV,ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY StreamingTV
ORDER BY churn_rate DESC;

/*
Analysis 13: Churn Rate by Streaming TV

Insight:
Customers with Streaming TV have a churn rate of 30.07%,
compared to 33.52% for customers without Streaming TV.

Business Interpretation:
Streaming TV shows only a weak association with customer
retention compared to support and security services.

Recommendation:
Streaming TV may improve customer engagement, but it is
not a major retention driver.
*/

-- Analysis 14: Churn Rate by Streaming Movies

SELECT StreamingMovies,ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY StreamingMovies
ORDER BY churn_rate DESC;

/*
Analysis 14: Churn Rate by Streaming Movies

Insight:
Customers with Streaming Movies have a churn rate of
29.94%, compared to 33.68% for customers without
Streaming Movies.

Business Interpretation:
Streaming Movies shows only a weak association with
customer retention compared to support and security services.

Recommendation:
Streaming Movies may improve customer engagement,
but it is not a major retention driver.
*/


-- Analysis 15: Churn Rate by Partner Status

SELECT Partner,ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY Partner
ORDER BY churn_rate DESC;

/*
Analysis 15: Churn Rate by Partner Status

Insight:
Customers without a partner have a churn rate of 32.96%,
while customers with a partner have a churn rate of 19.66%.

Business Interpretation:
Customers with partners appear more likely to stay with
the company and demonstrate stronger customer retention.

Recommendation:
Target single customers with loyalty programs and
personalized offers to improve retention.
*/


-- Analysis 16: Churn Rate by Dependents

SELECT Dependents,ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY Dependents
ORDER BY churn_rate DESC;

/*
Analysis 16: Churn Rate by Dependents

Insight:
Customers without dependents have a churn rate of
31.28%, while customers with dependents have a churn
rate of only 15.45%.

Business Interpretation:
Customers with dependents appear significantly more
likely to remain with the company.

Recommendation:
Create targeted retention campaigns for customers
without dependents, as they represent a higher-risk
segment.
*/


-- Analysis 17: Monthly Revenue Lost Due to Churn

SELECT
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_lost
FROM telco_churn
WHERE Churn = 'Yes';

/*
Analysis 17: Monthly Revenue Lost Due to Churn

Insight:
The company is losing approximately $139,130.85 in
monthly recurring revenue from churned customers.

Business Interpretation:
Customer churn is creating a significant revenue impact.
Even small improvements in retention could recover a
substantial amount of monthly revenue.

Recommendation:
Prioritize retention efforts for high-risk customer
segments such as month-to-month customers, electronic
check users, and customers without support/security
services.
*/

-- Analysis 18: Revenue Lost by Contract Type

SELECT
    Contract,
    ROUND(SUM(MonthlyCharges), 2) AS churned_revenue
FROM telco_churn
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY churned_revenue DESC;

/*
Analysis 18: Revenue Associated with Churned Customers by Contract Type

Insight:
Month-to-Month customers account for $120,847.10 of
monthly revenue associated with churned customers,
far exceeding One-Year and Two-Year contract customers.

Business Interpretation:
Month-to-Month customers represent the largest financial
risk to the business and contribute the majority of
revenue impacted by churn.

Recommendation:
Prioritize retention campaigns and contract upgrade
offers for Month-to-Month customers.
*/