--Identify high-usage columns in your User, Booking, and Property tables 

-- Create indexes for the User table
CREATE INDEX index_email ON Users (email);
CREATE INDEX index_role ON Users (role);

-- Create indexes for the Booking table
CREATE INDEX index_userid ON Booking (user_id);
CREATE INDEX index_propertyid ON Booking (property_id);
CREATE INDEX index_startdate ON Booking (start_date);
CREATE INDEX index_enddate ON Booking (end_date);

-- Create indexes for the Property table
CREATE INDEX index_hostid ON Properties (host_id);
CREATE INDEX index_location ON Properties (location);
CREATE INDEX index_price ON Properties (price_per_night);

