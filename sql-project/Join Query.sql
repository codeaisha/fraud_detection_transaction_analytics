USE FraudDetectionDB;

SELECT
    fa.alert_id,
    t.transaction_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_number,
    t.transaction_type,
    t.amount,
    t.transaction_time,
    COALESCE(m.merchant_name, 'No Merchant') AS merchant_name,
    t.city AS transaction_city,
    t.country AS transaction_country,
    fa.alert_type,
    fa.risk_score,
    fa.alert_status
FROM Fraud_Alerts AS fa
JOIN Transactions AS t
    ON fa.transaction_id = t.transaction_id
JOIN Accounts AS a
    ON t.account_id = a.account_id
JOIN Customers AS c
    ON a.customer_id = c.customer_id
LEFT JOIN Merchants AS m
    ON t.merchant_id = m.merchant_id
ORDER BY fa.risk_score DESC;