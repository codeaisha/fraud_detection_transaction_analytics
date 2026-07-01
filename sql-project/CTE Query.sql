USE FraudDetectionDB;

WITH CustomerTransactionSummary AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COUNT(t.transaction_id) AS total_transactions,
        COALESCE(SUM(t.amount), 0) AS total_transaction_amount,
        COALESCE(AVG(t.amount), 0) AS average_transaction_amount,
        COALESCE(MAX(t.amount), 0) AS largest_transaction
    FROM Customers AS c
    LEFT JOIN Accounts AS a
        ON c.customer_id = a.customer_id
    LEFT JOIN Transactions AS t
        ON a.account_id = t.account_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)

SELECT
    customer_id,
    customer_name,
    total_transactions,
    total_transaction_amount,
    ROUND(average_transaction_amount, 2) AS average_transaction_amount,
    largest_transaction,
    CASE
        WHEN total_transaction_amount >= 150000 THEN 'High Spender'
        WHEN total_transaction_amount >= 50000 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS spending_category
FROM CustomerTransactionSummary
ORDER BY total_transaction_amount DESC;