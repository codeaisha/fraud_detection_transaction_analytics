USE FraudDetectionDB;

-- ==========================================
-- VIEW 1 : High Risk Transactions
-- ==========================================

CREATE OR REPLACE VIEW HighRiskTransactions AS
SELECT
    t.transaction_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    a.account_number,
    t.amount,
    t.transaction_time,
    t.city,
    t.country,
    COALESCE(m.merchant_name,'No Merchant') AS merchant_name,
    COALESCE(m.risk_level,'Low') AS merchant_risk,
    t.transaction_status
FROM Transactions t
JOIN Accounts a
ON t.account_id=a.account_id
JOIN Customers c
ON a.customer_id=c.customer_id
LEFT JOIN Merchants m
ON t.merchant_id=m.merchant_id
WHERE
      t.amount>=50000
   OR m.risk_level='High'
   OR t.country<>'India';

SELECT * FROM HighRiskTransactions;



-- ==========================================
-- VIEW 2 : Customer Account Summary
-- ==========================================

CREATE OR REPLACE VIEW CustomerAccountSummary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(t.transaction_id) AS total_transactions,
    COALESCE(SUM(t.amount),0) AS total_amount,
    ROUND(COALESCE(AVG(t.amount),0),2) AS average_amount
FROM Customers c
LEFT JOIN Accounts a
ON c.customer_id=a.customer_id
LEFT JOIN Transactions t
ON a.account_id=t.account_id
GROUP BY
c.customer_id,
customer_name;

SELECT * FROM CustomerAccountSummary;



-- ==========================================
-- VIEW 3 : Merchant Performance
-- ==========================================

CREATE OR REPLACE VIEW MerchantPerformance AS
SELECT
    m.merchant_id,
    m.merchant_name,
    m.merchant_category,
    m.risk_level,
    COUNT(t.transaction_id) AS total_transactions,
    COALESCE(SUM(t.amount),0) AS total_sales,
    ROUND(COALESCE(AVG(t.amount),0),2) AS average_sale
FROM Merchants m
LEFT JOIN Transactions t
ON m.merchant_id=t.merchant_id
GROUP BY
m.merchant_id,
m.merchant_name,
m.merchant_category,
m.risk_level;

SELECT * FROM MerchantPerformance;



-- ==========================================
-- VIEW 4 : Fraud Monitoring Dashboard
-- ==========================================

CREATE OR REPLACE VIEW FraudDashboard AS
SELECT
    fa.alert_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    a.account_number,
    t.transaction_id,
    t.amount,
    t.transaction_time,
    COALESCE(m.merchant_name,'No Merchant') AS merchant_name,
    COALESCE(m.risk_level,'Low') AS merchant_risk,
    fa.alert_type,
    fa.risk_score,
    fa.alert_status
FROM Fraud_Alerts fa
JOIN Transactions t
ON fa.transaction_id=t.transaction_id
JOIN Accounts a
ON t.account_id=a.account_id
JOIN Customers c
ON a.customer_id=c.customer_id
LEFT JOIN Merchants m
ON t.merchant_id=m.merchant_id;

SELECT * FROM FraudDashboard;