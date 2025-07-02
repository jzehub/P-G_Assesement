-- Delivery-level data
deliveries (
    delivery_id VARCHAR,
    delivery_person_id VARCHAR,
    restaurant_area VARCHAR,
    customer_area VARCHAR,
    delivery_distance_km FLOAT,
    delivery_time_min INT,
    order_placed_at TIMESTAMP,
    weather_condition VARCHAR,
    traffic_condition VARCHAR,
    delivery_rating FLOAT
)
-- Delivery personnel metadata
delivery_persons (
    delivery_person_id INT,
    name VARCHAR,
    region VARCHAR, 
    hired_date DATE,
    is_active BOOLEAN
)

-- Restaurant metadata
restaurants (
    restaurant_id VARCHAR,
    area VARCHAR,
    name VARCHAR,
    cuisine_type VARCHAR,
    avg_preparation_time_min FLOAT
)
-- Orders table
orders (
    order_id INT,
    delivery_id VARCHAR,
    restaurant_id VARCHAR,
    customer_id VARCHAR,
    order_value FLOAT,
    items_count INT
)