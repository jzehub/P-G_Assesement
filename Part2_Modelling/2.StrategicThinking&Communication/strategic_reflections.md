## 💭 Strategic Thinking & Communication

---

### 1️⃣ Model Failure: Your model underestimates delivery time on rainy days. Do you fix the model, the data, or the business expectations?

The most effective way to address this issue is to **start by analyzing the data**. If rainy-day records are underrepresented or lack important weather-related features (e.g., rain intensity, wind speed), then the model is missing crucial signals — this is a **data quality issue**.

Once data coverage and quality are ensured, we can improve the **model** by:

- Incorporating **interaction features**, such as `Rainy × Traffic_Level`, which may better capture delivery complexity under bad weather.
- Using **quantile regression** or **multi-objective loss functions** to account for prediction uncertainty, especially on the upper end (longer deliveries).
- Creating a **rain-specific model** or an **ensemble** that adjusts predictions under adverse weather conditions.

Lastly, we may need to **adjust business expectations** if external factors (like infrastructure or rider safety) make rain-related delays unavoidable, even with better predictions.

---

### 2️⃣ Transferability: The model performs well in Mumbai. It’s now being deployed in São Paulo. How do you ensure generalization?

To ensure generalization in a new geographic context like São Paulo, we must:

- **Compare feature distributions** between the two cities (e.g., average traffic, weather, road length).
- **Avoid location-specific leakage** by excluding or generalizing features like `district_name`, `zone_code`, or local ID tags.
- **Retrain or fine-tune the model** using historical data from São Paulo, even if partially labeled.

Additionally, continuous **monitoring** of predictions post-deployment is crucial. If error patterns emerge in São Paulo, we can incrementally retrain using real-world feedback (e.g., actual delivery logs) to maintain performance.

---

### 3️⃣ Generative AI tools are a great resource that can facilitate development. What parts of this project did you use GenAI tools for? How did you validate or modify their output?

Generative AI tools played a supportive role throughout this project, particularly in two areas:

- **Debugging and Interpretation:**  
  AI was used to assist in identifying and understanding issues related to error metrics, and data visualization. This helped clarify where the models were failing and guided adjustments in preprocessing or model structure.

- **Communication and Documentation:**  
  GenAI tools were also helpful in refining the wording of insights and explanations to express ideas more clearly and professionally. This ensured that the technical findings could be communicated effectively to both technical and non-technical audiences.

To validate the output, all AI-assisted content and suggestions were cross-checked by:

- Referring to official documentation (e.g., scikit-learn, XGBoost, pandas).
- Consulting trusted sources such as academic papers, technical blogs, or official tutorials.
- Running code end-to-end to ensure correctness and reproducibility of results.

Generative AI acted as a **productivity booster and writing assistant**, but final decisions and implementations were based on personal validation and technical judgment.

### 4️⃣ Your Signature Insight: What's one non-obvious insight or decision you are proud of from this project?

One of the most meaningful insights I’m proud of in this project was uncovering **why traffic level was not as impactful on delivery time as initially expected**. Intuitively, traffic should be a dominant factor in food delivery delays. However, after analyzing feature importance across models and correlating it with vehicle types, I developed the hypothesis that:

> **Since a large portion of deliveries are completed using scooters or bikes—vehicles less affected by traffic congestion—traffic level becomes a less predictive feature.**

This insight helped reshape the model interpretation and suggested that **vehicle type moderates the effect of traffic**, an interaction not immediately obvious without careful analysis.

Additionally, I’m proud of the work around **error distribution analysis**, which revealed that most models were biased toward underpredicting longer delivery times.



### 5️⃣ Going to Production: Deployment Strategy

To successfully deploy the final **Multiple Linear Regression** model to production, the following components and practices should be included in the codebase and workflow:

---

#### 1. Model Serialization
The trained model should be serialized and saved in a reusable format. This allows the model to be loaded in a production environment without retraining. Serialization ensures consistency and reproducibility when serving predictions.

---

#### 2. Prediction API
A lightweight REST API should be developed to serve predictions. This API will:
- Receive incoming data in a structured format (e.g., JSON).
- Apply the same preprocessing steps used during training.
- Return the predicted delivery time in real time.

This makes the model accessible to other systems (e.g., dashboards, web apps, logistics platforms).

---

#### 3. Preprocessing Pipeline
To guarantee consistency between training and production, a preprocessing pipeline must be created. This pipeline includes:
- Handling of missing values
- One-hot encoding for categorical variables
- Any feature engineering steps required

Embedding preprocessing into a pipeline ensures that the model receives data in the same format during both training and inference.

---

#### 4. Containerization and Deployment
Containerizing the application using tools like Docker ensures that the API and model run in a consistent environment across development, staging, and production. This simplifies testing and deployment.

CI/CD (Continuous Integration/Continuous Deployment) pipelines should be set up using tools such as GitHub Actions, GitLab CI/CD, or Jenkins to:
- Automate testing and validation
- Deploy the application to cloud services (e.g., AWS, GCP, Azure)
- Monitor performance and enable rapid updates

---