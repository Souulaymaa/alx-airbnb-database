--Identify high-usage columns in your User, Booking, and Property tables 

-- Create indexes for the User table
CREATE INDEX index_email ON Users (email);
CREATE INDEX index_role ON Users (role);

-- Create indexes for the Booking table
CREATE INDEX index_userid ON Booking (user_id);
CREATE INDEX index_propertyid ON Booking (property_id);
CREATE INDEX index_startdate ON Booking (start_date);
CREATE INDEX index_enddate ON Booking (end_date);

-- Create indexes for the Property table
CREATE INDEX index_hostid ON Properties (host_id);
CREATE INDEX index_location ON Properties (location);
CREATE INDEX index_price ON Properties (price_per_night);

-- Measure performance before/after using EXPLAIN ANALYZE

-- Users: Find user by email
EXPLAIN ANALYZE SELECT * FROM Users WHERE email = 'alice@example.com';

-- Users: Filter by role
EXPLAIN ANALYZE SELECT * FROM Users WHERE role = 'host';

-- Bookings: Find bookings by user_id
EXPLAIN ANALYZE SELECT * FROM Bookings WHERE user_id = 42;

-- Bookings: Find bookings by property_id
EXPLAIN ANALYZE SELECT * FROM Bookings WHERE property_id = 100;

-- Bookings: Availability check
EXPLAIN ANALYZE 
SELECT * 
FROM Bookings 
WHERE property_id = 100 
  AND start_date <= '2025-09-15' 
  AND end_date >= '2025-09-11';

-- Properties: Search by location
EXPLAIN ANALYZE SELECT * FROM Properties WHERE location = 'Berlin';

-- Properties: Order by price
EXPLAIN ANALYZE SELECT * FROM Properties ORDER BY price_per_night LIMIT 10;


