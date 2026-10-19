CREATE TABLE reps (rep_id INT PRIMARY KEY, rep_name VARCHAR(50), region VARCHAR(20), monthly_target INT);
CREATE TABLE products (item VARCHAR(50) PRIMARY KEY, category VARCHAR(20), unit_price INT);
CREATE TABLE customers (customer_id INT PRIMARY KEY, first_name VARCHAR(30), last_name VARCHAR(30), city VARCHAR(30), region VARCHAR(20), age INT, rep_id INT);
CREATE TABLE orders (order_id INT PRIMARY KEY, customer_id INT, item VARCHAR(50), quantity INT, amount INT, status VARCHAR(20), order_month VARCHAR(7));
