-- creating customers table
CREATE TABLE customers (
    customer_id text PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    age_group VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    registration_date DATE,
    loyalty_tier VARCHAR(20),
    total_orders INT,
    total_spent DECIMAL(10, 2)
);

-- creating orders table
CREATE TABLE orders (
    order_id text PRIMARY KEY,
    customer_id text ,
    order_date DATE,
    month text,
    quarter text,
    year INT,
    order_status VARCHAR(20),
    sales_channel VARCHAR(20),
    payment_method VARCHAR(20),
    discount_pct DECIMAL(5, 2),
    subtotal DECIMAL(10, 2),
    shipping_cost DECIMAL(10, 2),
    order_total DECIMAL(10, 2),
    deliver_days INT
);

-- creating products table
CREATE TABLE products (
    product_id text PRIMARY KEY,
    product_name VARCHAR(100),
    brand VARCHAR(50),
    category VARCHAR(50),
    gender VARCHAR(10),
    color VARCHAR(20),
    size_available VARCHAR(100),
    cost_price DECIMAL(10, 2),
    selling_price DECIMAL(10, 2),
    profit_margin_pct DECIMAL(5, 2),
    stock_quantity INT,
    rating DECIMAL(3, 2),
    review_count INT
);

-- creating returns table
CREATE TABLE returns (
    return_id text PRIMARY KEY,
    order_id text ,
    customer_id text ,
    return_date DATE,
    return_reason VARCHAR(100),
    refund_amount DECIMAL(10, 2),
    refund_status VARCHAR(20)
);

-- creating order_items table
CREATE TABLE order_items (
    item_id text PRIMARY KEY,
    order_id text ,
    product_id text ,
    product_name VARCHAR(100),
    brand VARCHAR(50),
    category VARCHAR(50),
    size int,
    quantity INT,
    unit_price DECIMAL(10, 2),
    discount_pct DECIMAL(5, 2),
    discount_amount DECIMAL(10, 2),
    line_total DECIMAL(10, 2)
);

--set the owner of the tables to postgres

ALTER TABLE customers OWNER TO postgres;
ALTER TABLE orders OWNER TO postgres;
ALTER TABLE order_items OWNER TO postgres;
ALTER TABLE products OWNER TO postgres;
ALTER TABLE returns OWNER TO postgres;
/*
-- Create indexes for foreign key columns to improve query performance
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
Create INDEX idx_returns_order_id ON returns(order_id);
Create INDEX idx_returns_customer_id ON returns(customer_id);
*/

    

--DROP TABLE IF EXISTS customers, orders, order_items, products, returns;

select * from customers LIMIT 10;
select * from orders LIMIT 10;
select * from order_items LIMIT 10;
select * from products LIMIT 10;
select * from returns LIMIT 10;