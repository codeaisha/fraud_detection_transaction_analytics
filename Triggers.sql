USE FraudDetectionDB;

-- ==========================================
-- Trigger : Automatic Fraud Detection
-- ==========================================

DELIMITER $$

CREATE TRIGGER trg_AutoFraudDetection
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN

    DECLARE risk DECIMAL(5,2);
    DECLARE alert VARCHAR(50);

    -- High Amount
    IF NEW.amount >= 100000 THEN

        SET risk = 95;
        SET alert = 'High Amount';

        INSERT INTO Fraud_Alerts
        (
            transaction_id,
            alert_type,
            risk_score,
            alert_status,
            alert_description
        )
        VALUES
        (
            NEW.transaction_id,
            alert,
            risk,
            'Open',
            'Automatically detected: High transaction amount.'
        );

    END IF;


    -- High Risk Merchant
    IF EXISTS
    (
        SELECT *
        FROM Merchants
        WHERE merchant_id = NEW.merchant_id
        AND risk_level='High'
    )

    THEN

        INSERT INTO Fraud_Alerts
        (
            transaction_id,
            alert_type,
            risk_score,
            alert_status,
            alert_description
        )
        VALUES
        (
            NEW.transaction_id,
            'High Risk Merchant',
            85,
            'Open',
            'Automatically detected: Transaction with a high-risk merchant.'
        );

    END IF;


    -- International Transaction
    IF NEW.country <> 'India' THEN

        INSERT INTO Fraud_Alerts
        (
            transaction_id,
            alert_type,
            risk_score,
            alert_status,
            alert_description
        )
        VALUES
        (
            NEW.transaction_id,
            'Unusual Location',
            90,
            'Open',
            'Automatically detected: International transaction.'
        );

    END IF;

END$$

DELIMITER ;



-- ==========================================
-- Test the Trigger
-- ==========================================

INSERT INTO Transactions
(
account_id,
merchant_id,
transaction_type,
amount,
transaction_time,
payment_method,
transaction_status,
city,
country,
ip_address
)
VALUES
(
1,
8,
'Purchase',
180000,
NOW(),
'Card',
'Completed',
'Dubai',
'UAE',
'150.10.10.10'
);



-- ==========================================
-- Check Generated Alerts
-- ==========================================

SELECT *
FROM Fraud_Alerts
ORDER BY alert_id DESC;