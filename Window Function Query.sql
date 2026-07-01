USE FraudDetectionDB;

WITH OrderedTransactions AS (
    SELECT
        transaction_id,
        account_id,
        amount,
        transaction_time,
        LAG(transaction_time) OVER (
            PARTITION BY account_id
            ORDER BY transaction_time
        ) AS previous_transaction_time
    FROM Transactions
)

SELECT
    transaction_id,
    account_id,
    amount,
    previous_transaction_time,
    transaction_time,
    TIMESTAMPDIFF(
        MINUTE,
        previous_transaction_time,
        transaction_time
    ) AS minutes_since_previous_transaction
FROM OrderedTransactions
WHERE TIMESTAMPDIFF(
    MINUTE,
    previous_transaction_time,
    transaction_time
) <= 5
ORDER BY account_id, transaction_time;