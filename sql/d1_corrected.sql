-- Data Correction Script
UPDATE orders SET amount = quantity * (SELECT unit_price FROM products WHERE products.item = orders.item) WHERE amount IS NULL;
