USE FraudDetectionDB;

-- ==========================================
-- Procedure 1 : Customer Transaction History
-- ==========================================

DELIMITER $$

CREATE PROCEDURE GetCustomerTransactions(IN p_customer_id INT)
BEGIN
    SELECT
        c.customer_id,
        CONCAT(c.first_name,' ',c.last_name) AS customer_name,
        a.account_number,
        t.transaction_id,
        t.transaction_type,
        t.amount,
        t.transaction_time,
        t.transaction_status
    FROM Customers c
    JOIN Accounts a
        ON c.customer_id = a.customer_id
    JOIN Transactions t
        ON a.account_id = t.account_id
    WHERE c.customer_id = p_customer_id
    ORDER BY t.transaction_time DESC;
END $$

DELIMITER ;



-- ==========================================
-- Procedure 2 : Transactions Above Amount
-- ==========================================

DELIMITER $$

CREATE PROCEDURE GetHighValueTransactions(IN p_amount DECIMAL(15,2))
BEGIN
    SELECT
        transaction_id,
        account_id,
        amount,
        transaction_time,
        payment_method,
        transaction_status
    FROM Transactions
    WHERE amount >= p_amount
    ORDER BY amount DESC;
END $$

DELIMITER ;



-- ==========================================
-- Procedure 3 : Fraud Alerts By Status
-- ==========================================

DELIMITER $$

CREATE PROCEDURE GetFraudAlerts(IN p_status VARCHAR(30))
BEGIN
    SELECT
        alert_id,
        transaction_id,
        alert_type,
        risk_score,
        alert_status,
        detected_at
    FROM Fraud_Alerts
    WHERE alert_status = p_status
    ORDER BY risk_score DESC;
END $$

DELIMITER ;



-- ==========================================
-- Execute Procedures
-- ==========================================

CALL GetCustomerTransactions(1);

CALL GetHighValueTransactions(50000);

CALL GetFraudAlerts('Investigating');