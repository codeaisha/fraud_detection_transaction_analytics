USE FraudDetectionDB;

CREATE TABLE Transactions (
    transaction_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    merchant_id INT NULL,
    transaction_type ENUM(
        'Purchase', 'Transfer', 'Withdrawal', 'Deposit'
    ) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transaction_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM(
        'Card', 'UPI', 'Online Banking', 'Cash', 'Cheque'
    ) NOT NULL,
    transaction_status ENUM(
        'Completed', 'Pending', 'Failed', 'Declined'
    ) NOT NULL DEFAULT 'Completed',
    city VARCHAR(50),
    country VARCHAR(50),
    ip_address VARCHAR(45),

    CONSTRAINT fk_transactions_account
        FOREIGN KEY (account_id)
        REFERENCES Accounts(account_id),

    CONSTRAINT fk_transactions_merchant
        FOREIGN KEY (merchant_id)
        REFERENCES Merchants(merchant_id),

    CONSTRAINT chk_positive_amount
        CHECK (amount > 0)
);

SHOW TABLES;