CREATE SCHEMA tig3;
/*
--Create a Lookup Table for Expense Policies
*/
-- DROP TABLE tig.ExpensePolicies
CREATE TABLE tig3.ExpensePolicies (
    PolicyID INT IDENTITY(1,1) PRIMARY KEY,
    ExpenseCategory NVARCHAR(50),
    PolicyName NVARCHAR(100),
    Currency NVARCHAR(10),
    EffectiveDate DATE,
    ExpiryDate DATE,
    RequiresPreApproval BIT,
    Notes NVARCHAR(MAX)
);

/*
Insert Policy Metadata (No Repetition)
*/
INSERT INTO tig3.ExpensePolicies (
    ExpenseCategory, PolicyName, Currency,
    EffectiveDate, ExpiryDate, RequiresPreApproval, Notes
) VALUES
('Travel', 'Travel Expense Policy', 'USD', '2025-01-01', '2025-12-31', 0, 'Use company booking tools; no personal travel costs.'),
('Accommodation', 'Accommodation Expense Policy', 'USD', '2025-01-01', '2025-12-31', 0, 'Use preferred hotel booking tools; no luxury stays.'),
('Meals', 'Meal Expense Policy', 'USD', '2025-01-01', '2025-12-31', 0, 'Claim only personal meals unless hosting clients.'),
('Entertainment', 'Entertainment Expense Policy', 'USD', '2025-01-01', '2025-12-31', 1, 'Manager approval required; include event documentation.'),
('Office Supplies', 'Office Supplies Policy', 'USD', '2025-01-01', '2025-12-31', 0, 'Monthly cap; use approved suppliers.'),
('Expense Claim', 'General Expense Claim Policy', 'USD', '2025-01-01', '2025-12-31', 0, 'Receipts required for all claims.');

SELECT * FROM tig3.ExpensePolicies;

/*
Create a Lookup Table for Expense Categories
This table holds unique expense categories and their associated limits and guidelines.
*/
-- DROP TABLE tigs.ExpenseCategoryPolicy
CREATE TABLE tig3.ExpensePolicyDetails (
    PolicyID INT FOREIGN KEY REFERENCES tig3.ExpensePolicies(PolicyID),
    LimitAmount DECIMAL(10,2),
    LimitUnit NVARCHAR(20),
    Guidelines NVARCHAR(MAX)
);
/*
Insert Policy Metadata (No Repetition)
*/
/*
Populate ExpenseCategoryPolicy with Data from the Document
*/
INSERT INTO tig3.ExpensePolicyDetails (
    PolicyID, LimitAmount, LimitUnit, Guidelines
) VALUES
(1, 600.00, 'per trip',
 'Book economical and direct transportation using preferred tools. Avoid upgrades, change/cancellation fees, or extra baggage.'),
(2, 170.00, 'per night',
 'Stay at standard hotels near business destinations. Avoid luxury hotels and extra charges like minibar or spa.'),
(3, 55.00, 'per day',
 'Limit meals to breakfast, lunch, and dinner at reasonably priced places. No alcohol or lavish meals unless hosting business events.'),
(4, 110.00, 'per event',
 'Claim only for business-related events with prior approval. Provide event details, attendees, and business purpose.'),
(5, 30.00, 'per month',
 'Claim only necessary work-related supplies from approved vendors. Avoid personal items like gifts or decorations.'),
(6, 200.00, 'per claim',
 'Covers miscellaneous reimbursable business expenses not categorized elsewhere. Receipts required for all claims.');

SELECT * FROM tig3.ExpensePolicyDetails;



--Create a Lookup Table for Expense Categories Responsibles
-- DROP TABLE tig.ExpenseCategoryResponsibles
CREATE TABLE tig3.ExpenseCategoryResponsibles (
    ResponsibleID INT IDENTITY(1,1) PRIMARY KEY,
    PolicyID INT FOREIGN KEY REFERENCES tig3.ExpensePolicies(PolicyID),
    FullName NVARCHAR(100),
    Role NVARCHAR(100),
    Phone NVARCHAR(20),
    TimeZoneAvailable NVARCHAR(50)
);


-- Insert initial static data
INSERT INTO tig3.ExpenseCategoryResponsibles (PolicyID, FullName, Role, Phone, TimeZoneAvailable) VALUES
(1, 'Alice Johnson', 'Travel Coordinator', '+1-555-1234', 'EST'),
(2, 'Bob Smith', 'Accommodation Manager', '+1-555-2345', 'CST'),
(3, 'Carol Lee', 'Meal Expense Supervisor', '+1-555-3456', 'PST'),
(4, 'David Kim', 'Events Lead', '+1-555-4567', 'MST'),
(5, 'Eva Brown', 'Office Supplies Admin', '+1-555-5678', 'EST'),
(6, 'Sandra White', 'Expense Claim Manager', '+1-555-9012', 'EST');


SELECT * FROM tig3.ExpenseCategoryResponsibles;