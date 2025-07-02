# SQL Insights

Through the exploratory SQL analysis, we identified key operational factors that impact food delivery time. Each query was designed to isolate a specific variable—restaurant location, delivery person, traffic condition, or cuisine type—to determine how it influences performance.

## 🔍 Important Observations

- **Customer Areas**: Some customer zones consistently experience higher delivery times, possibly due to distance or traffic congestion.
- **Restaurant Location & Cuisine**: Certain restaurant areas and cuisine types tend to be slower, potentially due to food preparation complexity or kitchen capacity.
- **Traffic Conditions**: Deliveries made during high-traffic conditions show a clear increase in delivery time, confirming its critical role.
- **Delivery Personnel**: By filtering active couriers with more than 50 deliveries, we identified the top performers in terms of speed. This can help with future route optimization or incentive programs.
- **Restaurant Profitability**: One restaurant area stands out as the most profitable in the last 3 months, suggesting a strategic opportunity to improve service where the business impact is highest.

## 💡 Improvement Suggestions (SQL + Data)

1. **Add Ratings to Restaurants Table**  
   Incorporating customer ratings in the `restaurants` table could help identify restaurants with consistently poor performance. We could then correlate low ratings with high delivery times to flag operational issues.

2. **Create a User Feedback Table**  
   A new `feedback` table linked to orders or restaurants would allow us to capture structured customer complaints. Text or rating-based sentiment analysis can help prioritize interventions and improve customer satisfaction.

3. **Time-based Aggregations**  
   Incorporate weekly or monthly aggregations in the delivery data to monitor trends over time. This will allow the operations team to detect seasonal or time-based patterns that affect service.

5. **Benchmarking by Zone**  
   Compare average delivery times not only per area but also by benchmark groups (e.g., low vs. high traffic + short vs. long distance) to isolate combined impact factors.

6.**Analyze Order Complexity via Item Count**  
   By analyzing how the number of items in an order affects delivery time, we can identify a potential operational bottleneck. Orders with too many items may take longer to prepare, pack, or deliver. This insight could help:

   - Optimize **menu bundles** to limit complexity.
   - Suggest **"express" menu formats** with fewer items for faster delivery.
   - Inform **delivery time estimations** shown to users at checkout.

   A query grouping delivery time by item count brackets (e.g., 1–3, 4–6, 7+) would help understand at what point complexity begins to impact performance.
---
