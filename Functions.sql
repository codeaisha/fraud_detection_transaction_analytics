USE FraudDetectionDB;

-- ==========================================
-- Function 1 : Transaction Risk Level
-- ==========================================

DELIMITER $$

CREATE FUNCTION GetRiskLevel(
    p_amount DECIMAL(15,2)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE risk VARCHAR(20);

    IF p_amount >= 100000 THEN
        SET risk = 'High Risk';

    ELSEIF p_amount >= 50000 THEN
        SET risk = 'Medium Risk';

    ELSE
        SET risk = 'Low Risk';

    END IF;

    RETURN risk;

END $$

DELIMITER ;



-- ==========================================
-- Function 2 : Customer Full Name
-- ==========================================

DELIMITER $$

CREATE FUNCTION GetCustomerName(
    p_customer_id INT
)
RETURNS VARCHAR(120)
DETERMINISTIC
BEGIN

    DECLARE fullname VARCHAR(120);

    SELECT CONCAT(first_name,' ',last_name)
    INTO fullname
    FROM Customers
    WHERE customer_id = p_customer_id;

    RETURN fullname;

END $$

DELIMITER ;



-- ==========================================
-- Function 3 : Merchant Risk Category
-- ==========================================

DELIMITER $$

CREATE FUNCTION GetMerchantRisk(
    p_merchant_id INT
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE risk VARCHAR(20);

    SELECT risk_level
    INTO risk
    FROM Merchants
    WHERE merchant_id = p_merchant_id;

    RETURN risk;

END $$

DELIMITER ;



-- ==========================================
-- Test the Functions
-- ==========================================

SELECT GetRiskLevel(25000) AS Risk_Level;

SELECT GetRiskLevel(70000) AS Risk_Level;

SELECT GetRiskLevel(150000) AS Risk_Level;

SELECT GetCustomerName(1) AS Customer_Name;

SELECT GetMerchantRisk(4) AS Merchant_Risk;