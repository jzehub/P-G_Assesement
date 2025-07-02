--Query #1 Top 5 customer areas with highest average delivery time in the last 30 days
select customer_area AS "Customer Area", AVG(delivery_time_min)
FROM deliveries
where order_placed_at >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY customer_area
ORDER BY AVG(delivery_time_min) DESC
LIMIT 5;

--Query #2 Average delivery time per traffic condition, by restaurant area and cuisine type
select AVG(d.delivery_time_min), d.traffic_condition AS "Traffic Condition", r.area AS "Restaurant Area", r.cuisine_type AS "Cuisine Type"
from deliveries d
JOIN orders o ON deliveries.delivery_id = orders.delivery_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id 
GROUP BY d.traffic_condition, r.area, r.cuisine_type

--Query #3 Top 10 delivery people with the fastest average delivery time, considering only those with at least 50 deliveries and who are still active.
select p.name AS "Delivery Persons Name" , AVG(d.delivery_time_min) AS "Average Delivery Time", COUNT(*) AS "Total Deliveries"
from deliveries d 
JOIN p.delivery_person_id ON d.delivery_person_id = p.delivery_person_id
WHERE p.is_active = TRUE
GROUP BY p.name
HAVING COUNT(*)>= 50
ORDER BY AVG(d.delivery_time_min) ASC
LIMIT 10;

--Query #4 The most profitable restaurant area in the last 3 months, defined as the area with the highest total order value.
select r.area AS "Restaurant Area", SUM(o.order_value) AS "Total Order Value"
from orders o
JOIN deliveries d ON o.delivery_id = d.delivery_id
JOIN restaurants r ON o.restaurant_id= r.restaurant_id
WHERE d.order_placed_at >= (CURRENT_DATE - INTERVAL '3 months')
GROUP BY r.area
ORDER BY SUM(o.order_value) DESC
LIMIT 1;

--Query #5 Identify whether any delivery people show an increasing trend in average delivery time.
select p.name AS "Delivery Person Name",DATE_TRUNC('week', d.order_placed_at) AS "Week", AVG(d.delivery_time_min) AS "Average Delivery Time"
from deliveries d
JOIN delivery_persons p ON d.delivery_person_id = p.delivery_person_id
WHERE d.order_placed_at >= (CURRENT_DATE -INTE  RVAL '6 months')
GROUP BY p.name, DATE_TRUNC('week', d.order_placed_at)
ORDER BY p.name, DATE_TRUNC('week', d.order_placed_at);