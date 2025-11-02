
/*
Step-by-step: Static Data Indexing for Copilot Knowledge Base
1. Create the table to store responsible persons for each expense category.
2. Insert static data rows for initial indexing.
3. Use SELECT to verify if the data inserted.
4. From Copilot Studio, add ExpenseCategoryResponsibles as a knowledge base.
5. Test the knowledge base.
6. Insert additional rows and confirm instant access.
7. Copilot queries this table to answer responsibility-related questions in real time.
*/

-- Step 1: Create ExpenseCategoryResponsibles Table
CREATE SCHEMA tig;


CREATE TABLE tig.ExpenseCategoryResponsibles (
    ExpenseCategory NVARCHAR(50),
    FullName NVARCHAR(100),
    Role NVARCHAR(100),
    Phone NVARCHAR(20),
    TimeZoneAvailable NVARCHAR(50)
);



-- Step 2: Initial static data insert
INSERT INTO tig.ExpenseCategoryResponsibles (ExpenseCategory, FullName, Role, Phone, TimeZoneAvailable) VALUES
('Travel', 'Alice Johnson', 'Travel Coordinator', '+1-555-1234', 'EST'),
('Accommodation', 'Bob Smith', 'Accommodation Manager', '+1-555-2345', 'CST'),
('Meals', 'Carol Lee', 'Meal Expense Supervisor', '+1-555-3456', 'PST'),
('Entertainment', 'David Kim', 'Events Lead', '+1-555-4567', 'MST'),
('Office Supplies', 'Eva Brown', 'Office Supplies Admin', '+1-555-5678', 'EST');



-- Step 3: Query to verify data is inserted
SELECT * FROM tig.ExpenseCategoryResponsibles;


-- Step 4: From Copilot Studio, add ExpenseCategoryResponsibles as a knowledge base.

-- Step 5. Test the knowledge base.

-- Step 6: Add more rows and test immediate availability
INSERT INTO tig.ExpenseCategoryResponsibles (ExpenseCategory, FullName, Role, Phone, TimeZoneAvailable) VALUES
('Travel', 'Frank Turner', 'Senior Travel Analyst', '+1-555-6789', 'EST'),
('Accommodation', 'Grace Lin', 'Hotel Booking Specialist', '+1-555-7890', 'CST'),
('Meals', 'Henry Adams', 'Corporate Meal Planner', '+1-555-8901', 'PST');


-- Step 7: Query to verify data is inserted
SELECT * FROM tig.ExpenseCategoryResponsibles
WHERE ExpenseCategory = 'Meals';

-- Step 7. Test the knowledge base to validate if new inserted rows are available.
