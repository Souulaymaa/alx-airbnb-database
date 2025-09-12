-- Drop the existing Bookings table (use with caution: data loss!)
DROP TABLE IF EXISTS Bookings;

-- Recreate Bookings table with partitioning by YEAR(start_date)
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- Example query to test performance before/after partitioning
EXPLAIN ANALYZE
SELECT *
FROM Bookings
WHERE start_date BETWEEN '2025-09-01' AND '2025-09-30';
