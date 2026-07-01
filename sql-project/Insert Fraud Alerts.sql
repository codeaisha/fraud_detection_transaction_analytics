USE FraudDetectionDB;

INSERT INTO Transactions
(account_id, merchant_id, transaction_type, amount,
 transaction_time, payment_method, transaction_status,
 city, country, ip_address)
VALUES
(1, 1, 'Purchase', 2499.00, '2026-06-01 10:15:00',
 'Card', 'Completed', 'Mumbai', 'India', '103.10.1.1'),

(2, 7, 'Purchase', 1850.00, '2026-06-02 12:30:00',
 'UPI', 'Completed', 'Delhi', 'India', '103.10.1.2'),

(3, 6, 'Purchase', 3200.00, '2026-06-03 09:45:00',
 'Card', 'Completed', 'Ahmedabad', 'India', '103.10.1.3'),

(4, 9, 'Purchase', 950.00, '2026-06-04 20:10:00',
 'UPI', 'Completed', 'Hyderabad', 'India', '103.10.1.4'),

(5, NULL, 'Withdrawal', 10000.00, '2026-06-05 11:00:00',
 'Card', 'Completed', 'Jaipur', 'India', '103.10.1.5'),

(6, 2, 'Purchase', 5600.00, '2026-06-06 14:20:00',
 'Card', 'Completed', 'Chennai', 'India', '103.10.1.6'),

(7, 10, 'Purchase', 14500.00, '2026-06-07 16:40:00',
 'Online Banking', 'Completed', 'Kolkata', 'India', '103.10.1.7'),

(8, NULL, 'Deposit', 25000.00, '2026-06-08 10:00:00',
 'Cash', 'Completed', 'Pune', 'India', NULL),

-- High-value suspicious transactions
(1, 4, 'Purchase', 95000.00, '2026-06-10 02:15:00',
 'Card', 'Completed', 'Delhi', 'India', '198.51.100.10'),

(4, 8, 'Purchase', 125000.00, '2026-06-11 03:30:00',
 'Card', 'Completed', 'Dubai', 'UAE', '198.51.100.20'),

(5, 5, 'Transfer', 150000.00, '2026-06-12 01:10:00',
 'Online Banking', 'Completed', 'Mumbai', 'India', '198.51.100.30'),

-- Rapid transactions from the same account
(2, 1, 'Purchase', 12000.00, '2026-06-15 18:00:00',
 'Card', 'Completed', 'Delhi', 'India', '103.20.5.1'),

(2, 2, 'Purchase', 13500.00, '2026-06-15 18:02:00',
 'Card', 'Completed', 'Delhi', 'India', '103.20.5.1'),

(2, 3, 'Purchase', 18000.00, '2026-06-15 18:04:00',
 'Card', 'Completed', 'Delhi', 'India', '103.20.5.1'),

-- Declined and failed attempts
(3, 4, 'Purchase', 75000.00, '2026-06-18 23:20:00',
 'Card', 'Declined', 'Delhi', 'India', '203.0.113.15'),

(3, 4, 'Purchase', 76000.00, '2026-06-18 23:22:00',
 'Card', 'Failed', 'Delhi', 'India', '203.0.113.15'),

(7, 8, 'Purchase', 88000.00, '2026-06-20 04:40:00',
 'Card', 'Completed', 'Dubai', 'UAE', '203.0.113.25'),

(8, 7, 'Purchase', 4200.00, '2026-06-21 13:10:00',
 'UPI', 'Completed', 'Pune', 'India', '103.30.2.8'),

(9, 3, 'Purchase', 35000.00, '2026-06-22 15:30:00',
 'Card', 'Completed', 'Mumbai', 'India', '103.30.2.9'),

(10, NULL, 'Transfer', 50000.00, '2026-06-23 17:15:00',
 'Online Banking', 'Pending', 'Delhi', 'India', '103.30.2.10');

SELECT * FROM Transactions;