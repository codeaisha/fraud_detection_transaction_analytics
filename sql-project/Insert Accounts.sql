USE FraudDetectionDB;

INSERT INTO Accounts
(customer_id, account_number, account_type, balance, account_status)
VALUES
(1, 'ACC100001', 'Savings', 85000.00, 'Active'),
(2, 'ACC100002', 'Current', 125000.00, 'Active'),
(3, 'ACC100003', 'Savings', 67000.00, 'Active'),
(4, 'ACC100004', 'Savings', 92000.00, 'Active'),
(5, 'ACC100005', 'Current', 180000.00, 'Active'),
(6, 'ACC100006', 'Credit', 45000.00, 'Active'),
(7, 'ACC100007', 'Savings', 73000.00, 'Active'),
(8, 'ACC100008', 'Current', 110000.00, 'Active'),

-- Two customers have an additional account
(1, 'ACC100009', 'Credit', 30000.00, 'Active'),
(2, 'ACC100010', 'Savings', 56000.00, 'Active');

SELECT * FROM Accounts;