# Calculate rides by rider type

# CYCLISTIC BIKE-SHARE ANALYSIS
# Exploratory Data Analysis
# 1. Total rides by rider type

library(tidyverse)
# Load the cleaned Cyclistic dataset
clean_trips <- read_csv("Cleaned_Data/cyclistic_cleaned.csv")

# Filter to the Tableau dashboard reporting period
clean_trips <- clean_trips %>%
  filter(
    as.Date(ride_date) >= as.Date("2024-08-01"),
    as.Date(ride_date) <= as.Date("2025-07-31")
  )

# Verify the number of rides
print(nrow(clean_trips))

rider_summary <- clean_trips |>
  count(member_casual, name = "total_rides") |>
  mutate(
    percentage = round(total_rides / sum(total_rides) * 100, 1)
  )

print(rider_summary)

# 2. Average ride duration by rider type

duration_summary <- clean_trips |>
  group_by(member_casual) |>
  summarise(
    average_minutes = round(mean(ride_length_mins), 2)
  )

print(duration_summary)


# 3. Total rides by day of the week

weekday_summary <- clean_trips |>
  count(day_of_week, member_casual,
        name = "total_rides")

print(weekday_summary)



# 4. Weekday vs Weekend Analysis

weekend_summary <- clean_trips |>
  count(member_casual, day_type,
        name = "total_rides") |>
  group_by(member_casual) |>
  mutate(
    percentage = round(total_rides / sum(total_rides) * 100, 1)
  ) |>
  ungroup()

print(weekend_summary)


# 5. Monthly rides by rider type

monthly_summary <- clean_trips |>
  count(month, member_casual,
        name = "total_rides")

print(monthly_summary)


# 6. Monthly Riding Trend Chart

# Arrange months from August 2024 to July 2025
monthly_summary$month <- factor(
  as.character(monthly_summary$month),
  levels = c(
    "Aug", "Sep", "Oct", "Nov", "Dec",
    "Jan", "Feb", "Mar", "Apr", "May",
    "Jun", "Jul"
  )
)

# Create monthly line chart
monthly_chart <- ggplot(
  monthly_summary,
  aes(
    x = month,
    y = total_rides,
    color = member_casual,
    group = member_casual
  )
) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  labs(
    title = "Monthly Rides by Rider Type",
    subtitle = "August 2024 - July 2025",
    x = "Month",
    y = "Total Rides",
    color = "Rider Type"
  ) +
  theme_minimal()

# Display chart
print(monthly_chart)



# 7. Rides by hour of the day

hourly_summary <- clean_trips |>
  count(hour, member_casual,
        name = "total_rides") |>
  arrange(hour)

print(hourly_summary, n = 48)



# 8. Hourly Riding Trend Chart

hourly_chart <- ggplot(
  hourly_summary,
  aes(
    x = hour,
    y = total_rides,
    color = member_casual
  )
) +
  geom_line(linewidth = 1) +
  labs(
    title = "Hourly Rides by Rider Type",
    subtitle = "August 2024 - July 2025",
    x = "Hour of Day (24-hour clock)",
    y = "Total Rides",
    color = "Rider Type"
  ) +
  scale_x_continuous(breaks = seq(0, 23, 2)) +
  theme_minimal()

print(hourly_chart)

file.exists("Charts/hourly_rides_by_rider_type.png")


# 9. Bike Type Analysis

bike_type_summary <- clean_trips |>
  count(rideable_type, member_casual,
        name = "total_rides") |>
  group_by(member_casual) |>
  mutate(
    percentage = round(total_rides / sum(total_rides) * 100, 1)
  ) |>
  ungroup()

print(bike_type_summary, n = Inf)


# 10. Bike Type Comparison Chart

bike_chart <- ggplot(
  bike_type_summary,
  aes(
    x = rideable_type,
    y = total_rides,
    fill = member_casual
  )
) +
  geom_col(position = "dodge") +
  labs(
    title = "Bike Type Usage by Rider Type",
    subtitle = "August 2024 - July 2025",
    x = "Bike Type",
    y = "Total Rides",
    fill = "Rider Type"
  ) +
  theme_minimal()



# 11. Weekday Riding Comparison Chart

# Arrange days from Monday to Sunday
weekday_summary$day_of_week <- factor(
  weekday_summary$day_of_week,
  levels = c("Mon", "Tue", "Wed", "Thu",
             "Fri", "Sat", "Sun")
)

# Create weekday bar chart
weekday_chart <- ggplot(
  weekday_summary,
  aes(
    x = day_of_week,
    y = total_rides,
    fill = member_casual
  )
) +
  geom_col(position = "dodge") +
  labs(
    title = "Rides by Day of the Week",
    subtitle = "August 2024 - July 2025",
    x = "Day of Week",
    y = "Total Rides",
    fill = "Rider Type"
  ) +
  theme_minimal()

print(weekday_chart)



# 12. Export Summary Tables for Tableau

write_csv(rider_summary,
          "Summary_Tables/rider_summary.csv")

write_csv(duration_summary,
          "Summary_Tables/duration_summary.csv")

write_csv(weekday_summary,
          "Summary_Tables/weekday_summary.csv")

write_csv(weekend_summary,
          "Summary_Tables/weekend_summary.csv")

write_csv(monthly_summary,
          "Summary_Tables/monthly_summary.csv")

write_csv(hourly_summary,
          "Summary_Tables/hourly_summary.csv")

write_csv(bike_type_summary,
          "Summary_Tables/bike_type_summary.csv")
