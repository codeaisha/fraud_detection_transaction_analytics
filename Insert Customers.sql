USE FraudDetectionDB;

INSERT INTO Customers
(first_name, last_name, email, phone, date_of_birth, gender, city, state, country)
VALUES
('Aarav', 'Sharma', 'aarav.sharma@email.com', '9876500001',
 '1992-04-15', 'Male', 'Mumbai', 'Maharashtra', 'India'),

('Priya', 'Verma', 'priya.verma@email.com', '9876500002',
 '1995-08-22', 'Female', 'Delhi', 'Delhi', 'India'),

('Rohan', 'Patel', 'rohan.patel@email.com', '9876500003',
 '1988-11-10', 'Male', 'Ahmedabad', 'Gujarat', 'India'),

('Sneha', 'Reddy', 'sneha.reddy@email.com', '9876500004',
 '1997-02-18', 'Female', 'Hyderabad', 'Telangana', 'India'),

('Vikram', 'Singh', 'vikram.singh@email.com', '9876500005',
 '1985-06-30', 'Male', 'Jaipur', 'Rajasthan', 'India'),

('Ananya', 'Iyer', 'ananya.iyer@email.com', '9876500006',
 '1993-09-12', 'Female', 'Chennai', 'Tamil Nadu', 'India'),

('Rahul', 'Das', 'rahul.das@email.com', '9876500007',
 '1990-01-25', 'Male', 'Kolkata', 'West Bengal', 'India'),

('Meera', 'Joshi', 'meera.joshi@email.com', '9876500008',
 '1998-12-05', 'Female', 'Pune', 'Maharashtra', 'India');

SELECT * FROM Customers;