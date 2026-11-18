# Cyclistic Bike-Share Analysis

**Reporting Period:** August 2024 – July 2025

**Tools Used:** R, RStudio, tidyverse, dplyr, lubridate, Tableau Public

## Project Overview

This project analyzes 5,605,235 Cyclistic bike-share rides to identify differences in riding behavior between annual members and casual riders.

The primary business objective is to understand how casual riders use the service differently from annual members and recommend strategies for increasing annual memberships.

## Business Questions

1. How do annual members and casual riders use Cyclistic bikes differently?
2. What are the peak riding hours, days, and months?
3. How does average ride duration differ between rider groups?
4. Which bike and scooter types are most frequently used?
5. What marketing strategies could encourage casual riders to become annual members?

## Data Preparation and Analysis

The analysis was conducted using R and the tidyverse.

Key activities included:

- Combining 12 months of bike-share trip data.
- Cleaning and standardizing column names.
- Handling missing values and invalid ride durations.
- Creating date, month, weekday, hour, and ride-duration variables.
- Comparing member and casual rider behavior.
- Preparing cleaned data for Tableau visualization.

## Key Findings

| Metric | Result |
|---|---|
| Total Rides | 5,605,235 |
| Member Rides | 3,552,519 |
| Casual Rides | 2,052,716 |
| Member Share | 63.4% |
| Average Casual Ride Duration | 19.5 minutes |
| Average Member Ride Duration | 11.8 minutes |

### Additional Insights

- Annual members account for the majority of recorded rides.
- Casual riders take longer rides on average than annual members.
- Riding activity varies by month, day of the week, and hour.
- Bike and scooter preferences differ between rider groups.

## Tableau Dashboard

An interactive Tableau dashboard was developed to communicate the findings.

The dashboard includes:

- Four KPI cards showing total rides, member rides, casual rides, and member share.
- Monthly riding trends.
- Total rides by rider type.
- Hourly riding patterns.
- Rides by day of the week.
- Average ride duration.
- Rides by bike and scooter type.

Interactive filters allow users to explore the data by rider type, bike/scooter type, and ride month.

**[View Interactive Tableau Dashboard](https://public.tableau.com:9443/views/CyclisticBike-ShareAnalysisAugust2024July2025/Dashboard1)**

## Business Recommendations

1. **Target casual riders:** Develop membership campaigns aimed at casual riders during periods of high demand.
2. **Promote membership benefits:** Highlight the potential convenience and value of annual membership.
3. **Use seasonal marketing:** Focus promotional campaigns on months with stronger casual riding activity.
4. **Personalize promotions:** Tailor marketing messages based on differences in riding behavior and bike preferences.

## Conclusion

The analysis highlights meaningful differences between annual members and casual riders. These findings can support data-driven marketing strategies designed to improve membership conversion and customer engagement.

## Skills Demonstrated

- Data cleaning and preparation
- Exploratory data analysis
- R programming
- Data transformation
- KPI development
- Tableau dashboard design
- Interactive data visualization
- Business insights and recommendations
