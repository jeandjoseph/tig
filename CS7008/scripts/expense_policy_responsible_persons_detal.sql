-- Insert new responsible persons
INSERT INTO tig.ExpenseCategoryResponsibles (ExpenseCategory, FullName, Role, Phone, TimeZoneAvailable) VALUES
('Travel', 'Frank Turner', 'Senior Travel Analyst', '+1-555-6789', 'EST'),
('Accommodation', 'Grace Lin', 'Hotel Booking Specialist', '+1-555-7890', 'CST'),
('Meals', 'Henry Adams', 'Corporate Meal Planner', '+1-555-8901', 'PST');

-- Insert address records for each new responsible person
INSERT INTO tig.Address (ResponsibleID, AddressLine1, City, StateProvince, CountryRegion, PostalCode) VALUES
(6, '4000 Explorer Rd.', 'Orlando', 'Florida', 'United States', '32801'),      -- Frank Turner
(7, '2100 Magnolia Ave.', 'Houston', 'Texas', 'United States', '77002'),       -- Grace Lin
(8, '1234 Market St.', 'San Francisco', 'California', 'United States', '94103'); -- Henry Adams