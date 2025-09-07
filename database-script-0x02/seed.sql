-- USERS
INSERT INTO Users (user_id, name, email, password_hash, phone, created_at)
VALUES
(1, 'Alice Johnson', 'alice@example.com', 'hashed_pw_1', '+491701234567', NOW()),
(2, 'Mohammed El Amrani', 'mohammed@example.com', 'hashed_pw_2', '+212612345678', NOW()),
(3, 'Sophia Müller', 'sophia@example.com', 'hashed_pw_3', '+491512223344', NOW());

-- PROPERTIES
INSERT INTO Properties (property_id, user_id, title, description, location, price_per_night, created_at)
VALUES
(1, 1, 'Cozy Apartment in Berlin', 'Modern 2-room apartment near Alexanderplatz', 'Berlin, Germany', 80.00, NOW()),
(2, 2, 'Beachfront Villa Casablanca', 'Luxury villa with private pool and sea view', 'Casablanca, Morocco', 250.00, NOW()),
(3, 3, 'Rustic Cabin in Black Forest', 'Wooden cabin with fireplace and hiking trails nearby', 'Baden-Württemberg, Germany', 120.00, NOW());

-- BOOKINGS
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, status, created_at)
VALUES
(1, 1, 2, '2025-09-10', '2025-09-15', 'confirmed', NOW()),
(2, 2, 3, '2025-10-01', '2025-10-07', 'pending', NOW()),
(3, 3, 1, '2025-11-05', '2025-11-12', 'cancelled', NOW());

-- PAYMENTS
INSERT INTO Payments (payment_id, booking_id, amount, method, status, paid_at)
VALUES
(1, 1, 400.00, 'Credit Card', 'completed', NOW()),
(2, 2, 1750.00, 'PayPal', 'pending', NULL),
(3, 3, 840.00, 'Credit Card', 'refunded', '2025-11-01');

-- REVIEWS
INSERT INTO Reviews (review_id, booking_id, user_id, rating, comment, created_at)
VALUES
(1, 1, 2, 5, 'Amazing apartment! Super clean and great location.', NOW()),
(2, 2, 3, 4, 'Villa was beautiful, but WiFi could be faster.', NOW()),
(3, 3, 1, 3, 'Cabin was cozy but had heating issues.', NOW());
