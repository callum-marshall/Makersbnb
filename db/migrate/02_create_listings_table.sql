CREATE TABLE listings (id SERIAL PRIMARY KEY, owner_id int NOT NULL, description TEXT, name TEXT, price money, FOREIGN KEY (owner_id) REFERENCES users (id));
