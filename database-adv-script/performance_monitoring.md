# Performance Monitoring Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

## Step 1: Monitoring Queries

We used `EXPLAIN ANALYZE` to measure execution plans of frequently used queries.

### Example Query: Retrieve bookings with user and property details
```sql
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-09-01' AND '2025-09-30';
```

### Observations
- Full table scans on `Bookings`.  
- Nested loops caused slow performance for large datasets.  
- No effective use of indexes.

## Step 2: Identified Bottlenecks
- Missing indexes on `Bookings.user_id`, `Bookings.property_id`, and `Bookings.start_date`.  
- Queries filtered by `start_date` were scanning the entire table.  

## Step 3: Schema Adjustments

### Indexing
```sql
CREATE INDEX idx_bookings_userid ON Bookings(user_id);
CREATE INDEX idx_bookings_propertyid ON Bookings(property_id);
CREATE INDEX idx_bookings_startdate ON Bookings(start_date);
```

### Partitioning (by year of start_date)
```sql
ALTER TABLE Bookings
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);
```

## Step 4: Post-Optimization Monitoring

```sql
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-09-01' AND '2025-09-30';
```

### Results
- Query now uses **index lookups** and scans only the relevant partition (`p2025`).  
- Rows examined reduced significantly.  
- Execution time improved from full scan to fast index-based retrieval.

## Conclusion
By **monitoring queries** with `EXPLAIN ANALYZE`, we identified bottlenecks and applied:
- **Indexes** on join/filter columns.  
- **Partitioning** on `start_date`.  

This led to faster queries and a more scalable schema.  
