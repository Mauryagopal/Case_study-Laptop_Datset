# Case_study-Laptop_Datset

💻 Laptop Price Prediction
📌 Project Overview

This project focuses on predicting the price of laptops based on their specifications. The dataset was cleaned and transformed using SQL for feature engineering and Exploratory Data Analysis (EDA), followed by training a Linear Regression model in Python to predict laptop prices.

The project highlights how raw tabular data can be systematically prepared in SQL and then used for machine learning modeling.

🗂️ Dataset

Source: Laptop specifications and prices dataset (CSV format).

Size: ~X records with features like company, type, RAM, CPU, GPU, storage, OS, screen resolution, weight, and price.

🔧 Data Cleaning & Preprocessing (SQL)

Key transformations done using SQL:

Removed duplicates, null rows, and unnecessary columns.

Normalized textual data (e.g., removed GB, kg, inches suffixes).

Converted features to appropriate datatypes (INT, DECIMAL, etc.).

Extracted structured features:

CPU → brand, name, and speed (GHz).

GPU → brand and model name.

ScreenResolution → resolution width, resolution height, touchscreen flag.

Memory → memory type, primary storage, secondary storage.

Standardized categorical variables (e.g., Windows/Linux/macOS/Other for OS).

📊 Exploratory Data Analysis (EDA)

EDA was performed in SQL & Python to uncover insights such as:

Price distribution across different brands.

Effect of RAM, storage, and screen resolution on laptop prices.

Comparative trends between GPU brands and OS types.

🤖 Model Building

Algorithm Used: Linear Regression

Libraries: Scikit-learn, Pandas, NumPy, Matplotlib, Seaborn

Steps:

Imported cleaned dataset from SQL into Python.

Split data into training and testing sets.

Trained a Linear Regression model on engineered features.

Evaluated model using metrics such as R² score and RMSE.

📈 Results

Achieved an R² score of X.XX and RMSE of Y.YY (replace with your actual results).

Identified the most important factors influencing laptop prices (RAM, CPU speed, storage type, GPU brand, etc.).

🚀 Project Workflow
graph LR
A[Raw Dataset] --> B[SQL Data Cleaning]
B --> C[Feature Engineering in SQL]
C --> D[EDA in SQL & Python]
D --> E[Linear Regression Model in Python]
E --> F[Price Prediction & Insights]

🛠️ Tech Stack

SQL – Data cleaning, preprocessing, and feature engineering

Python – Modeling and visualization

Scikit-learn, Pandas, NumPy – ML & data analysis

Matplotlib, Seaborn – Visualization

📌 Key Learnings

Hands-on experience in SQL-based feature engineering for ML.

Integration of SQL + Python in an end-to-end ML workflow.

Practical understanding of how laptop specifications influence price.
