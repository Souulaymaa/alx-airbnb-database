-- Retrieve all bookings with user details, property details, and payment details

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id;

-- Analyse the querie's efficiency

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id;

-- Refactor the query to reduce execution time

-- adding indexes for faster JOINs
CREATE INDEX index_bookings_userid ON Bookings(user_id);
CREATE INDEX index_bookings_propertyid ON Bookings(property_id);
CREATE INDEX index_payments_bookingid ON Payments(booking_id);

-- adding indexes for faster lookups on frequently filtered columns
CREATE INDEX index_users_email ON Users(email);
CREATE INDEX index_properties_location ON Properties(location);

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id;

