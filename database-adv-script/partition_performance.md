# Partitioning Report

## Goal
The `Bookings` table was becoming slow for queries filtered by `start_date`.  
We applied **RANGE partitioning** based on the year of `start_date`.

## Test Query
```sql
EXPLAIN ANALYZE
SELECT *
FROM Bookings
WHERE start_date BETWEEN '2025-09-01' AND '2025-09-30';
```

## Observations

### Before partitioning:
- Full table scan across all rows.
- Slow response time as dataset size increased.

### After partitioning:
- Query scanned only the relevant partition (p2025).
- Reduced rows examined, faster execution time.
- Lower I/O and improved query efficiency.

## Conclusion
Partitioning by `start_date` significantly improves performance for date-based queries, especially when the table grows large.