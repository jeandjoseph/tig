-- Create ExpenseCategoryResponsibles with an ID for mapping
-- DROP TABLE tig.ExpenseCategoryResponsibles
CREATE TABLE tig.ExpenseCategoryResponsibles (
    ResponsibleID INT IDENTITY(1,1) PRIMARY KEY,
    ExpenseCategory NVARCHAR(50),
    FullName NVARCHAR(100),
    Role NVARCHAR(100),
    Phone NVARCHAR(20),
    TimeZoneAvailable NVARCHAR(50)
);

-- Insert initial static data
INSERT INTO tig.ExpenseCategoryResponsibles (ExpenseCategory, FullName, Role, Phone, TimeZoneAvailable) VALUES
('Travel', 'Alice Johnson', 'Travel Coordinator', '+1-555-1234', 'EST'),
('Accommodation', 'Bob Smith', 'Accommodation Manager', '+1-555-2345', 'CST'),
('Meals', 'Carol Lee', 'Meal Expense Supervisor', '+1-555-3456', 'PST'),
('Entertainment', 'David Kim', 'Events Lead', '+1-555-4567', 'MST'),
('Office Supplies', 'Eva Brown', 'Office Supplies Admin', '+1-555-5678', 'EST');

-- Create Address table mapped to ExpenseCategoryResponsibles
CREATE TABLE tig.Address (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    ResponsibleID INT FOREIGN KEY REFERENCES tig.ExpenseCategoryResponsibles(ResponsibleID),
    AddressLine1 NVARCHAR(100),
    City NVARCHAR(50),
    StateProvince NVARCHAR(50),
    CountryRegion NVARCHAR(50),
    PostalCode NVARCHAR(20)
);

-- Insert one address row per responsible person (example data)
INSERT INTO tig.Address (ResponsibleID, AddressLine1, City, StateProvince, CountryRegion, PostalCode) VALUES
(1, '8713 Yosemite Ct.', 'Bothell', 'Washington', 'United States', '98011'),      -- Alice Johnson
(2, '1318 Lasalle Street', 'Bothell', 'Washington', 'United States', '98012'),    -- Bob Smith
(3, '9178 Jumping St.', 'Dallas', 'Texas', 'United States', '75201'),             -- Carol Lee
(4, '2222 Conference Ave.', 'Denver', 'Colorado', 'United States', '80202'),      -- David Kim
(5, '5555 Office Park Blvd.', 'Atlanta', 'Georgia', 'United States', '30303');    -- Eva Brown


-- Query to verify mapping
SELECT 
    e.ExpenseCategory, e.FullName, a.AddressLine1, a.City, a.StateProvince, a.CountryRegion, a.PostalCode
FROM 
    tig.ExpenseCategoryResponsibles e
JOIN 
    tig.Address a ON e.ResponsibleID = a.ResponsibleID;