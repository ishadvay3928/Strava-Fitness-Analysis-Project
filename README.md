# Strava-Fitness-Analysis-Project

🧾 Project Overview
The Strava Data Analysis Project aims to extract meaningful insights from personal fitness data collected via the Strava app. The project involves data preprocessing, exploratory data analysis (EDA), metric calculations (like BMI, calories burned), and the creation of interactive dashboards using Power BI and Excel. This helps visualize workout trends, performance metrics, and health progress over time.

📁 Project Files
File Name	Description
Strava Full Merged Data.xlsx	The primary dataset containing merged daily Strava activity logs including steps, distance, weight, calories, etc.
full_timebased_data.csv	Time-based activity breakdowns (e.g., duration, ride types) on a granular level.
Strava Power BI Dashboard.pbix	Power BI file containing interactive visualizations such as ride trends, distance vs calories, BMI categories, and activity patterns.
Strava Excel Dashboard.xlsx	Excel dashboard summarizing activity stats and ride status by time of day.
README.md	Documentation of the entire project.
SQL_Preprocessing_Steps.sql	SQL script used for cleaning, merging, and calculating derived metrics before importing into BI tools.
Insights_and_Conclusion.docx	Document summarizing key findings from the dashboards.

🔧 Tools Used
Power BI – for interactive dashboard creation

Microsoft Excel – for preliminary analysis and dashboard

SQL (MySQL) – for data preprocessing, merging, and metric generation

Python (optional) – used during early data inspection and cleaning

🧹 Preprocessing Steps
Data Cleaning:

Handled missing values in WeightKg, avg_heart_rate, BMI, Fat, and minute_sleep_value.

Removed duplicate entries using SQL query:

sql
Copy
Edit
DELETE FROM strava_table
WHERE id NOT IN (
  SELECT MIN(id)
  FROM strava_table
  GROUP BY date_column, user_id, activity_type
);
Data Transformation:

Converted weights from pounds to kilograms.

Calculated BMI using: BMI = WeightKg / (Height in meters)^2

Created time-based splits for analysis of peak hours.

Derived Metrics:

Calculated Calories burned, Step intensity, Distance categories, and categorized BMI.

Derived cancellation rate from status using Excel formula:

excel
Copy
Edit
=COUNTIFS(StatusRange, "Cancelled") / COUNT(StatusRange)
📈 Dashboard Features
✅ Power BI Dashboard
Title: Personal Fitness Analytics - Strava Based

BMI Categories: Segments users into Underweight, Normal, Overweight, Obese using a SWITCH formula.

Activity Time Trend: Rides and workouts over time.

Distance vs Calories: Linear correlation between effort and calories burnt.

Monthly Aggregates: Bar chart for distance and steps.

Status Distribution: Visual of how many rides were completed, cancelled, or pending.

Heart Rate Overview: Average BPM during different months.

✅ Excel Dashboard
Hourly Ride Requests: Identifies morning (5–10 AM) and evening (5–9 PM) peaks.

Status by Hour: Cancellations and completions across hours.

Day-wise Activity Split: Weekdays vs weekends activity analysis.

📌 Key Insights
Most users take between 5,000–12,500 steps daily, with a spike at 10,000 steps, suggesting it's a common goal.

BMI Analysis reveals a majority fall under Normal or Overweight categories.

Highest calorie burn is associated with workouts over longer distances and higher average heart rate.

Ride cancellations increase significantly during late nights and early mornings.

Evening rides (post-5 PM) show a higher average distance and calories burned compared to morning rides.

🧾 Conclusion
The Strava data project effectively visualizes and analyzes fitness behavior over time using data-driven techniques. With the help of Excel and Power BI dashboards, clear patterns in ride preferences, calorie burn, BMI categories, and cancellation rates have been identified. These insights can guide users to optimize their workout schedules, improve consistency, and track long-term fitness goals. By integrating SQL-based preprocessing and interactive BI dashboards, the project serves as a practical case study for health-focused personal analytics.
