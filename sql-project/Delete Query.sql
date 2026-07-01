USE FraudDetectionDB;

DELETE FROM Fraud_Alerts
WHERE alert_id > 9;

SELECT * FROM Fraud_Alerts;