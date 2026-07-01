USE FraudDetectionDB;

CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    account_type ENUM('Savings', 'Current', 'Credit') NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    account_status ENUM('Active', 'Blocked', 'Closed')
        NOT NULL DEFAULT 'Active',
    opened_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_accounts_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

SHOW TABLES;