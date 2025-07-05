# 🏃‍♂️ Strava Fitness Analytics Project

The **Strava Fitness Analytics Project** is a multi-phase data analytics initiative that integrates MySQL-based data preprocessing, Python-based exploratory data analysis (EDA), and a rich Power BI dashboard to generate actionable insights on user fitness behavior. This project leverages granular-level data (daily, hourly, minute-wise) exported from fitness trackers to examine trends in physical activity, sleep, calories, and other health metrics.

---

## 📌 Project Objectives

* Integrate, clean, and merge multiple fitness datasets using **MySQL**.
* Conduct detailed **Exploratory Data Analysis (EDA)** in **Python**.
* Create an interactive **Power BI Dashboard** for real-time health and fitness tracking.
* Identify user behavior patterns, activity levels, and health risk indicators.

---

## 🗃️ Datasets Used

* **dailyCalories\_merged.csv**
* **dailyIntensities\_merged.csv**
* **dailySteps\_merged.csv**
* **heartrate\_seconds\_merged.csv**
* **hourlyCalories\_merged.csv**
* **hourlyIntensities\_merged.csv**
* **hourlySteps\_merged.csv**
* **minute-level datasets (Calories, Intensities, METs, Steps, Sleep)**
* **sleepDay\_merged.csv**
* **weightLogInfo\_merged.csv**

---

## 🔄 Phase 1: MySQL Data Integration & Preprocessing

### ✅ Table Creation & Data Loading

* Defined schemas with appropriate data types (`INT`, `FLOAT`, `DATETIME`, etc.).
* Used `LOAD DATA INFILE` to load CSVs.
* Parsed dates using `STR_TO_DATE`.
* Converted booleans and handled missing values using `NULLIF`.

### 🔗 Merging Strategy

* **Daily Merge**: Combined daily calories, intensities, steps, heart rate, sleep, and weight logs.
* **Time-Based Merge**: Joined hourly and minute-level datasets.
* **Final Merge**: Created `StravaFullMergedData` by merging daily and time-based datasets on `Id` and `ActivityDate`.

### 🧹 Data Cleaning & Processing

* Imputed missing values using mean for:

  * `avg_heart_rate`, `WeightKg`, `BMI`, `Fat`, and sleep columns.
* Dropped incomplete records (`calories_wide = NULL`).
* Detected and handled outliers (e.g., `BMI < 10 or > 50`).
* Resolved 521 duplicates using `AUTO_INCREMENT` and grouping logic.

### ✅ Final Outcome

A **cleaned**, **merged**, and **ready-to-analyze** master table: `StravaFullMergedData`.

---

## 📊 Phase 2: Python EDA on Merged Strava Data

### 🔍 Key Visualizations & Insights

1. **📈 Distribution of Total Steps**

   * Most users walk between **5,000–12,500 steps/day**, peaking at 10,000.

2. **📊 KDE Plot of Active Minutes**

   * Users spend most time in **lightly active** minutes, very few in high-intensity zones.

3. **📉 Timeline of Steps & Calories**

   * Daily fluctuations with visible drops around **May 9–12**.

4. **🎻 Violin Plot of Lightly Active Minutes**

   * Most users fall between **100–300 mins** with outliers at **600 mins**.

5. **⏱️ Activity Breakdown (Pie Chart)**

   * Majority of time spent in **SedentaryMinutes**, highlighting low overall activity.

6. **📏 Total Steps vs. Distance**

   * Strong **linear relationship**, confirming distance increases with steps.

7. **🥧 Activity-Based Distance Breakdown**

   * **61.8%** of total distance comes from light activity.

8. **📉 Steps vs. Active Minutes (Scatter Plot)**

   * Positive correlation between steps and very active minutes.

9. **📈 Pairplot of Distances**

   * **LightActiveDistance** shows the widest spread; others are right-skewed.

10. **🌡️ Correlation Heatmap**

    * `TotalSteps ↔ TotalDistance`: **0.99**
    * Strong correlations between distance and their matching minute metrics.
    * `SedentaryMinutes` has **negative correlation** with all active metrics.

### 🧠 Summary

Most users are moderately active, with a majority of time spent in sedentary behavior. Steps and distance are strongly correlated. Light activity dominates, and high-intensity activity is limited. Sedentary behavior shows inverse relation with all active measures.

---

## 📊 Phase 3: Power BI Fitness Dashboard

### 🧍‍♂️ User Overview Panel

| Metric          | Value      |
| --------------- | ---------- |
| BMI             | 25.21      |
| Weight (Kg)     | 72.09      |
| Fat (%)         | 24.00      |
| Avg. Heart Rate | 78.60 bpm  |
| Total Calories  | 2316 kcal  |
| Total Distance  | 5.51 km    |
| Total Steps     | 7666 steps |
| Sleep Duration  | 58 min/day |

* **Filters:** User ID & Date range slicers

---

### 📌 Dashboard Highlights

1. **📉 Hourly Steps vs. Calories (Scatter Plot)**

   * Positive correlation with peaks up to **8000 steps/hour**.

2. **📊 Daily Minute-Level Trends**

   * METs dominate minute metrics.
   * Peaks on days **2, 22, 24**, dips on **1, 5, 12**.

3. **❤️ Heart Rate Trends**

   * Healthy range between **77–80 bpm**; spikes indicate exertion.

4. **⚖️ BMI Category Distribution**

   * **96.23%** users fall in **Overweight**, followed by Normal and Obese.

5. **🔥 Monthly Calorie Burn**

   * April had **64.82%** of total calories burned, indicating higher activity.

6. **🛌 Sleep Duration Trends**

   * Consistently **below 7 hours/day**, with many days under **5 hours**.

---

## 📈 Conclusion

* Users show **moderate physical activity**, mostly walking/light intensity.
* Sedentary behavior is high; improvement needed in **Very Active Minutes**.
* **Sleep** is significantly lacking, affecting overall wellness.
* Power BI visualization empowers users to **track**, **analyze**, and **improve** health habits.

---

## 🛠️ Tools & Technologies

* **MySQL** – Data integration, merging, and preprocessing.
* **Python** – EDA with Pandas, Seaborn, Matplotlib.
* **Power BI** – Dashboard for real-time user analytics.

---

## 📁 Project Structure

```
Strava-Fitness-Analytics/
│
├── sql/
│   └── strava_table_creation_and_merging.sql
│
├── data/
│   └── [All CSV files]
│
├── notebooks/
│   └── strava_eda_analysis.ipynb
│
├── reports/
│   └── strava_dashboard.pbix
│
├── images/
│   └── [Plots from EDA]
│
├── README.md
└── requirements.txt
```

---

## 📬 Contact

**Isha Chaudhary**

📧 [ishadvay3928@gmail.com]

🔗 [LinkedIn](https://www.linkedin.com/in/ishachaudhary18/)

📍 Noida, India
