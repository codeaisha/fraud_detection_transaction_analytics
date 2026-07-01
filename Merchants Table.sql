USE FraudDetectionDB;

CREATE TABLE Merchants (
    merchant_id INT AUTO_INCREMENT PRIMARY KEY,
    merchant_name VARCHAR(100) NOT NULL,
    merchant_category VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    risk_level ENUM('Low', 'Medium', 'High')
        NOT NULL DEFAULT 'Low',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SHOW TABLES;