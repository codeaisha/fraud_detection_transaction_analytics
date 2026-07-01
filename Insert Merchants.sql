USE FraudDetectionDB;

INSERT INTO Merchants
(merchant_name, merchant_category, city, state, country, risk_level)
VALUES
('Amazon India', 'E-commerce', 'Bengaluru', 'Karnataka', 'India', 'Low'),
('Flipkart', 'E-commerce', 'Bengaluru', 'Karnataka', 'India', 'Low'),
('Reliance Digital', 'Electronics', 'Mumbai', 'Maharashtra', 'India', 'Medium'),
('Luxury Gold Store', 'Jewellery', 'Delhi', 'Delhi', 'India', 'High'),
('QuickCash Services', 'Financial Services', 'Mumbai', 'Maharashtra', 'India', 'High'),
('Indian Oil', 'Fuel', 'Delhi', 'Delhi', 'India', 'Low'),
('Big Bazaar', 'Groceries', 'Mumbai', 'Maharashtra', 'India', 'Low'),
('Global Electronics', 'Electronics', 'Dubai', 'Dubai', 'UAE', 'High'),
('Food Corner', 'Restaurant', 'Pune', 'Maharashtra', 'India', 'Low'),
('Travel World', 'Travel', 'Delhi', 'Delhi', 'India', 'Medium');

SELECT * FROM Merchants;