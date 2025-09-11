-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT COUNT (b.booking_id), b.user_id
FROM Bookings b
GROUP BY b.user_id;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT p.property_id, p.name, COUNT(b.booking_id)
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC)
FROM Properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;
