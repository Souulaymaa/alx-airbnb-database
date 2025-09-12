# Query Optimization Report

## Original Query
The query retrieves all bookings with associated **user**, **property**, and **payment** details.

## Performance Analysis
Using EXPLAIN ANALYZE, the original query showed:
- Full table scans on Bookings, Users, and Properties.
- Nested loops for joins, which can be costly for large datasets.
- Scanning unnecessary columns increases I/O overhead.

## Optimization Steps
### 1. Added Indexes
- Bookings(user_id) and Bookings(property_id) → speeds up JOINs.
- Payments(booking_id) → speeds up LEFT JOIN lookups.
- Users(email) → speeds up queries filtered by email.
- Properties(location) → speeds up location-based searches.

### 2. Refactored Query
- Removed user_id and property_id from SELECT where not needed.
- Selected only necessary columns to reduce I/O.
- Ensured joins use indexed columns

## Results
- EXPLAIN ANALYZE shows index lookups instead of full table scans.
- Rows scanned for joins reduced significantly.
- Execution time decreased, especially for large datasets.

### Conclusion:
 Adding targeted indexes and selecting only necessary columns improves query performance without losing important data.
