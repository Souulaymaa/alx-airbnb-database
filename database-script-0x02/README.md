### 📌 `data/README.md` (for the sample data inserts)
```markdown
# 📂 Sample Data – Airbnb Clone

## 📌 Overview
This folder contains **SQL insert statements** to populate the Airbnb Clone database with **realistic test data**.  
It simulates real-world usage, including users, properties, bookings, payments, and reviews.

---

## 📑 File
- **Sample_Data.sql** → `INSERT` statements for:
  - Users
  - Properties
  - Bookings
  - Payments
  - Reviews

---

## 🚀 How to Use
1. Load the schema first (see `/schema/README.md`).
2. Run the sample data script:
   ```bash
   mysql -u root -p < Sample_Data.sql
3. Query the database to test:
    SELECT * FROM Properties WHERE price_per_night < 100;