USE FraudDetectionDB;

-- ===========================================================
-- FINAL FRAUD DETECTION DASHBOARD
-- ===========================================================

SELECT

    t.transaction_id,

    CONCAT(c.first_name,' ',c.last_name) AS Customer_Name,

    a.account_number,

    a.account_type,

    t.transaction_type,

    t.amount,

    t.transaction_time,

    t.payment_method,

    t.transaction_status,

    t.city,

    t.country,

    COALESCE(m.merchant_name,'No Merchant') AS Merchant_Name,

    COALESCE(m.merchant_category,'N/A') AS Merchant_Category,

    COALESCE(m.risk_level,'Low') AS Merchant_Risk,

    COALESCE(f.alert_type,'No Alert') AS Alert_Type,

    COALESCE(f.risk_score,0) AS Risk_Score,

    COALESCE(f.alert_status,'Safe') AS Alert_Status,

    CASE

        WHEN f.risk_score >= 90 THEN 'Critical'

        WHEN f.risk_score >= 70 THEN 'High'

        WHEN f.risk_score >= 40 THEN 'Medium'

        ELSE 'Low'

    END AS Overall_Risk

FROM Transactions t

JOIN Accounts a
ON t.account_id = a.account_id

JOIN Customers c
ON a.customer_id = c.customer_id

LEFT JOIN Merchants m
ON t.merchant_id = m.merchant_id

LEFT JOIN Fraud_Alerts f
ON t.transaction_id = f.transaction_id

ORDER BY

COALESCE(f.risk_score,0) DESC,

t.amount DESC;