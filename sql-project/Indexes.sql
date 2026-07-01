USE FraudDetectionDB;

-- ==========================================
-- INDEX 1 : Transaction Time
-- ==========================================

CREATE INDEX idx_transaction_time
ON Transactions(transaction_time);



-- ==========================================
-- INDEX 2 : Transaction Amount
-- ==========================================

CREATE INDEX idx_transaction_amount
ON Transactions(amount);



-- ==========================================
-- INDEX 3 : Account ID
-- ==========================================

CREATE INDEX idx_account_id
ON Transactions(account_id);



-- ==========================================
-- INDEX 4 : Merchant Risk
-- ==========================================

CREATE INDEX idx_merchant_risk
ON Merchants(risk_level);



-- ==========================================
-- INDEX 5 : Alert Status
-- ==========================================

CREATE INDEX idx_alert_status
ON Fraud_Alerts(alert_status);



-- ==========================================
-- INDEX 6 : Customer Email
-- ==========================================

CREATE INDEX idx_customer_email
ON Customers(email);



-- ==========================================
-- View All Indexes
-- ==========================================

SHOW INDEX FROM Customers;

SHOW INDEX FROM Merchants;

SHOW INDEX FROM Transactions;

SHOW INDEX FROM Fraud_Alerts;