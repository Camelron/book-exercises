# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
install.packages("nycflights13")
library("nycflights13")
library("dplyr")
# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
View(flights)

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
flights <- mutate(flights, flying_delay = arr_delay) #honestly no clue what was being asked here

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
flights <- arrange(flights, -flying_delay)

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
rm(list = ls())
flights <- mutate(flights, flying_delay = arr_delay) %>% arrange(flying_delay)

# Make a histogram of the amount of time gained using the `hist()` function
hist(flights$flying_delay)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
gained <- summarize(flights, mean_gained = mean(flying_delay))

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created
temp <- filter(flights, dest == "SEA")
seatac <- data.frame(temp$origin, temp$dest, temp$flying_delay)

# On average, did flights to SeaTac gain or loose time?
gain <- mean(seatac$temp.flying_delay) > 0

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!
filter(flights, origin == "JFK", dest == "SEA") %>% 
  summarize(avg = mean(air_time), min = min(air_time), max = max(air_time))
