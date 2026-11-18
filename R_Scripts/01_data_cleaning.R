
# CYCLISTIC BIKE-SHARE ANALYSIS
# Reporting period: August 2024 - July 2025
# Step 1: Import and clean the data

library(tidyverse)
library(lubridate)

# Find the 12 monthly CSV files
csv_files <- list.files(
  "Raw_Data",
  pattern = "\\.csv$",
  full.names = TRUE
)

# Import and combine all 12 files
all_trips <- csv_files |>
  lapply(read_csv, show_col_types = FALSE) |>
  bind_rows()

# Check original dataset
dim(all_trips)
colSums(is.na(all_trips))
sum(duplicated(all_trips$ride_id))

# Calculate ride duration in minutes
all_trips$ride_length_mins <- as.numeric(
  difftime(all_trips$ended_at,
           all_trips$started_at,
           units = "mins")
)

# Keep rides longer than 0 and up to 24 hours
clean_trips <- all_trips |>
  filter(
    ride_length_mins > 0,
    ride_length_mins <= 1440
  )

# Create date and time columns
clean_trips <- clean_trips |>
  mutate(
    ride_date = as.Date(started_at),
    month = month(started_at, label = TRUE),
    day_of_week = wday(started_at, label = TRUE),
    hour = hour(started_at),
    day_type = if_else(
      wday(started_at) %in% c(1, 7),
      "Weekend",
      "Weekday"
    )
  )

# Check cleaned dataset
dim(clean_trips)

# Save cleaned dataset
write_csv(clean_trips, "Cleaned_Data/cyclistic_cleaned.csv")
