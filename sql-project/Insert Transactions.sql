USE FraudDetectionDB;

INSERT INTO Fraud_Alerts
(transaction_id, alert_type, risk_score, alert_status, alert_description)
VALUES
(9, 'High Amount', 88.00, 'Investigating',
 'Large jewellery purchase made during unusual hours'),

(10, 'Unusual Location', 96.00, 'Confirmed Fraud',
 'Transaction occurred in Dubai while customer is based in India'),

(11, 'High Amount', 92.00, 'Investigating',
 'Large transfer made to a high-risk financial merchant'),

(12, 'Rapid Transactions', 72.00, 'Open',
 'First transaction in a rapid sequence'),

(13, 'Rapid Transactions', 82.00, 'Open',
 'Second transaction from the same account within two minutes'),

(14, 'Rapid Transactions', 91.00, 'Investigating',
 'Third transaction from the same account within four minutes'),

(15, 'Multiple Failed Attempts', 78.00, 'Open',
 'High-value card transaction was declined'),

(16, 'Multiple Failed Attempts', 89.00, 'Investigating',
 'Repeated high-value attempt from the same IP address'),

(17, 'Unusual Location', 94.00, 'Confirmed Fraud',
 'International transaction at a high-risk merchant');

SELECT * FROM Fraud_Alerts;