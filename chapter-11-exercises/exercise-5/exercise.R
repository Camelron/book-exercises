# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")
View(flights)

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data

dep_delay_by_month <- flights %>% 
  group_by(month) %>% 
  filter(!is.na(dep_delay)) %>% 
  summarize(avg_delay = mean(dep_delay))
# Which month had the greatest average departure delay?
max(dep_delay_by_month)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows

arr_delay_by_dest <- flights %>% 
  group_by(dest) %>% 
  filter(!is.na(arr_delay)) %>% 
  summarize(avg_delay = mean(arr_delay))

# You can look up these airports in the `airports` data frame!
View(arr_delay_by_dest)

# Which city was flown to with the highest average speed?

speed_by_dest <- flights %>% 
  group_by(dest) %>% 
  filter(!is.na(distance / air_time)) %>% 
  summarize(avg_speed = mean(distance / air_time))
View(speed_by_dest)