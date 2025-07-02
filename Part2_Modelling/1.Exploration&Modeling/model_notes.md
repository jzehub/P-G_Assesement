### 🧠 Model Notes

---

#### ⚙️ Model Logic

In this project, I implemented multiple regression algorithms to compare their performance and select the one that best fits our business requirements. The models evaluated were:

- **Multiple Linear Regression**  
- **Decision Tree Regression**  
- **XGBoost Regression**

The goal was to visualize how each model behaves under the same data conditions and assess which provides the best balance between accuracy, interpretability, and generalization. By iterating through increasingly complex models, we aimed to understand both linear and non-linear relationships in the data.

---

#### 📏 Metric Choice

To evaluate model performance, I used a set of widely accepted regression metrics:

- **MAE (Mean Absolute Error):**  
  This metric represents the average absolute difference between the predicted and actual delivery times. It’s intuitive and gives a clear sense of how many minutes, on average, the model is off per prediction.

- **RMSE (Root Mean Squared Error):**  
  RMSE penalizes larger errors more heavily, which is useful when outliers or long delivery times are especially important to capture accurately. It also preserves the unit of the target variable (minutes), making it interpretable.


---

#### 🔧 Tuning Approach

Hyperparameters were manually adjusted based on prior knowledge and iterative experimentation. For Decision Tree and XGBoost models, I explored variations in `max_depth`, `n_estimators`, and `objective`, observing their effects on RMSE and MAE. This approach allowed for fast iteration and control over model complexity without relying on automated search tools.

