
-- Which sale channel has the highest total sales amount in the last quarter?
SELECT sales_channel, SUM(order_total) AS total_sales
from orders WHERE quarter = 'Q4' AND year = 2023
GROUP BY sales_channel
ORDER BY total_sales DESC;

-- what is the product performance in terms of sales for the last quarter?
SELECT p.product_name, o.customer_id, o.sales_channel, SUM(o.order_total) AS total_sales, o.year
from orders AS o
left join order_items AS oi on o.order_id = oi.order_id
left JOIN products AS p on oi.product_id = p.product_id
WHERE quarter = 'Q4' AND year = 2023
GROUP BY p.product_name, o.customer_id, o.sales_channel, o.year
ORDER BY total_sales DESC;


--what is the product performance in terms of sales channel over the years

SELECT sales_channel, year, SUM(order_total) AS total_sales
FROM orders
group by sales_channel, year
order by year, total_sales DESC;



--Which region had the most orders in the last quarter?
SELECT region, COUNT(order_id) AS total_orders
from orders
left join customers on orders.customer_id = customers.customer_id
WHERE quarter = 'Q4' AND year = 2023
GROUP BY region
ORDER BY total_orders DESC;

-- what is the top 10 most profitable products in terms of profit margin percentage and total profit for the last quarter?

SELECT P.product_name, 
concat(p.profit_margin_pct *100, '%') AS profit_margin_pct, 
SUM(O.order_total) AS total_profit,
O.quarter
FROM orders AS o
LEFT JOIN order_items AS oi ON o.order_id = oi.order_id
LEFT JOIN products AS p ON oi.product_id = p.product_id
WHERE o.quarter = 'Q4' AND o.year = 2023
GROUP BY p.brand, p.product_name, p.profit_margin_pct, o.quarter
ORDER BY total_profit DESC
LIMIT 10;






--what is the top 5 refund  amount by return reason and status for the last quarter?

SELECT return_reason, refund_status, SUM(refund_amount) AS total_refund
FROM returns
WHERE return_date >= '2023-10-01' AND return_date <= '2023-12-31'
group by return_reason, refund_status
order by total_refund DESC