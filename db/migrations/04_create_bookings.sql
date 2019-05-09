CREATE TABLE bookings (id SERIAL PRIMARY KEY, listing_id int, check_in_date date, check_out_date date, booker_id int, confirmed BOOLEAN);
