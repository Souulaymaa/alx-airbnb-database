# SQL Join Queries – Airbnb Database Tasks

This repository contains SQL queries that demonstrate the use of different types of joins on an Airbnb-like database. The tasks focus on retrieving related data from `users`, `bookings`, `properties`, and `reviews` tables.

## Tasks

### 1. INNER JOIN – Bookings and Users
Retrieve all bookings along with the respective users who made those bookings. Only bookings that have an associated user will be returned.

```sql
SELECT b.booking_id, b.property_id, b.booking_date, u.user_id, u.name
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;
```

### 2. LEFT JOIN – Properties and Reviews
Retrieve all properties and their reviews, including properties that have no reviews.

```sql
SELECT p.property_id, p.name AS property_name, r.review_id, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;
```

### 3. FULL OUTER JOIN – Users and Bookings
Retrieve all users and all bookings, even if a user has no bookings or a booking is not linked to a user.

```sql
SELECT u.user_id, u.name AS user_name, b.booking_id, b.property_id, b.booking_date
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
```
