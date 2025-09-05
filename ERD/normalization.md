# Database Normalization to 3NF

## Step 1: First Normal Form (1NF)
The schema already satisfies 1NF because:
- All attributes are atomic (e.g., `first_name`, `last_name` instead of a single `name` field).
- No repeating groups or multi-valued attributes are present.

## Step 2: Second Normal Form (2NF)
Since each entity has a single-attribute primary key, there are no partial dependencies.  
Therefore, the schema is already in 2NF.

## Step 3: Third Normal Form (3NF)
We checked for transitive dependencies:
- In **User**, **Property**, **Payment**, **Review**, and **Message**, all attributes depend directly on their primary key. No changes needed.
- In **Booking**, the attribute `total_price` is derived from (`end_date - start_date`) × `price_per_night`. Keeping it would introduce redundancy and risk anomalies.  
  → **Solution:** Remove `total_price` from the `Booking` table and compute it dynamically when needed.

## Final Adjusted Schema

![Normalized Diagram](ERD/images/er-normalized.png)

## Conclusion
After removing the derived field `total_price` from `Booking`, the database design satisfies 3NF. This ensures minimal redundancy, prevents update anomalies, and maintains data integrity.
