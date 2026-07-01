USE FraudDetectionDB;

CREATE TABLE Fraud_Alerts (
    alert_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    transaction_id BIGINT NOT NULL,
    alert_type ENUM(
        'High Amount',
        'Rapid Transactions',
        'Unusual Location',
        'High Risk Merchant',
        'Multiple Failed Attempts'
    ) NOT NULL,
    risk_score DECIMAL(5,2) NOT NULL,
    alert_status ENUM(
        'Open', 'Investigating', 'Confirmed Fraud', 'False Positive'
    ) NOT NULL DEFAULT 'Open',
    alert_description VARCHAR(255),
    detected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reviewed_at DATETIME NULL,

    CONSTRAINT fk_alert_transaction
        FOREIGN KEY (transaction_id)
        REFERENCES Transactions(transaction_id),

    CONSTRAINT chk_risk_score
        CHECK (risk_score BETWEEN 0 AND 100)
);

SHOW TABLES;