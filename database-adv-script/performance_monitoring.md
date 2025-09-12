# Database Performance Monitoring & Optimization  

## Objective  
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.  

## Step 1: Monitor Query Performance  

### MySQL  
```sql
-- Enable profiling
SET profiling = 1;

-- Example query
SELECT * FROM orders WHERE customer_id = 123;

-- Show executed queries
SHOW PROFILES;

-- Detailed profile for the last query
SHOW PROFILE FOR QUERY 1;
```

### PostgreSQL  
```sql
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM orders WHERE customer_id = 123;
```

## Step 2: Identify Bottlenecks  
Check for:  
- **Full table scans** on large tables  
- **High execution time** (ms/seconds)  
- **Rows examined vs. rows returned** mismatch  
- **Costly joins, sorting, or temporary tables**  

Example (Postgres):  
```
Seq Scan on orders  (cost=0.00..154.00 rows=2000 width=...)
Filter: (customer_id = 123)
```
🚨 Indicates a **sequential scan** due to a missing index.  

## Step 3: Suggested Improvements  
- Add indexes on frequently queried columns  
  ```sql
  CREATE INDEX idx_orders_customer_id ON orders(customer_id);
  ```
- Rewrite inefficient queries (avoid `SELECT *`, use explicit columns)  
- Use **covering indexes** for queries that filter + return specific columns  
- Consider **schema adjustments**:  
  - Normalize to reduce redundant writes  
  - Denormalize to reduce heavy joins  

## Step 4: Implement & Compare  

### Before Index
```
Execution Time: 120 ms
Rows Examined: 50,000
```

### After Index
```
Execution Time: 5 ms
Rows Examined: 5
```

✅ Improvement: **~24x faster**  

## Step 5: Continuous Monitoring  
- Run `EXPLAIN (ANALYZE)` on top queries weekly  
- Track query execution times in logs  
- Add monitoring dashboards (e.g., **pgAdmin, MySQL Workbench, Grafana + Prometheus**)  
- Revisit schema design when datasets grow significantly  

## Summary Report Example  
| Query | Issue | Fix | Before | After |  
|-------|-------|-----|--------|-------|  
| `SELECT * FROM orders WHERE customer_id = 123;` | Sequential scan | Added index on `customer_id` | 120 ms | 5 ms |  
