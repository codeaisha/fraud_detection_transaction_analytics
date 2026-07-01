USE FraudDetectionDB;

-- ==========================================
-- REPORT 1 : Overall Transaction Statistics
-- ==========================================

SELECT
    COUNT(*) AS Total_Transactions,
    SUM(amount) AS Total_Transaction_Amount,
    ROUND(AVG(amount),2) AS Average_Transaction,
    MAX(amount) AS Highest_Transaction,
    MIN(amount) AS Lowest_Transaction
FROM Transactions;



-- ==========================================
-- REPORT 2 : Customer Spending Report
-- ==========================================

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS Customer_Name,
    COUNT(t.transaction_id) AS Total_Transactions,
    SUM(t.amount) AS Total_Spent
FROM Customers c
JOIN Accounts a
ON c.customer_id=a.customer_id
JOIN Transactions t
ON a.account_id=t.account_id
GROUP BY c.customer_id,Customer_Name
ORDER BY Total_Spent DESC;



-- ==========================================
-- REPORT 3 : Merchant Performance
-- ==========================================

SELECT
    m.merchant_name,
    m.merchant_category,
    m.risk_level,
    COUNT(t.transaction_id) AS Total_Transactions,
    SUM(t.amount) AS Total_Sales
FROM Merchants m
LEFT JOIN Transactions t
ON m.merchant_id=t.merchant_id
GROUP BY
m.merchant_name,
m.merchant_category,
m.risk_level
ORDER BY Total_Sales DESC;



-- ==========================================
-- REPORT 4 : Fraud Alert Summary
-- ==========================================

SELECT
    alert_type,
    COUNT(*) AS Total_Alerts,
    ROUND(AVG(risk_score),2) AS Average_Risk
FROM Fraud_Alerts
GROUP BY alert_type
ORDER BY Total_Alerts DESC;



-- ==========================================
-- REPORT 5 : High Value Transactions
-- ==========================================

SELECT
    transaction_id,
    account_id,
    amount,
    transaction_time,
    transaction_status
FROM Transactions
WHERE amount>=50000
ORDER BY amount DESC;



-- ==========================================
-- REPORT 6 : Transactions by Payment Method
-- ==========================================

SELECT
    payment_method,
    COUNT(*) AS Total_Transactions,
    SUM(amount) AS Total_Amount
FROM Transactions
GROUP BY payment_method;



-- ==========================================
-- REPORT 7 : Transactions by Country
-- ==========================================

SELECT
    country,
    COUNT(*) AS Total_Transactions,
    SUM(amount) AS Total_Amount
FROM Transactions
GROUP BY country;



-- ==========================================
-- REPORT 8 : Failed / Declined Transactions
-- ==========================================

SELECT
    transaction_id,
    account_id,
    amount,
    transaction_status,
    transaction_time
FROM Transactions
WHERE transaction_status IN ('Failed','Declined');



-- ==========================================
-- REPORT 9 : Top 5 Customers
-- ==========================================

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS Customer_Name,
    SUM(t.amount) AS Total_Spent
FROM Customers c
JOIN Accounts a
ON c.customer_id=a.customer_id
JOIN Transactions t
ON a.account_id=t.account_id
GROUP BY
c.customer_id,
Customer_Name
ORDER BY Total_Spent DESC
LIMIT 5;



-- ==========================================
-- REPORT 10 : Suspicious Transactions
-- ==========================================

SELECT
    t.transaction_id,
    CONCAT(c.first_name,' ',c.last_name) AS Customer_Name,
    t.amount,
    t.country,
    m.merchant_name,
    m.risk_level,
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
   OR t.country<>'India'
   OR m.risk_level='High'
ORDER BY t.amount DESC;