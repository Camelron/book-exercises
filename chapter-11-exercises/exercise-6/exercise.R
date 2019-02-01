# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
View(flights)


destinations <- group_by(flights, dest)
destinations <- filter(destinations, arr_delay > 0) 
delays <- summarize(destinations, mean_delay = mean(arr_delay)) #sort of works, some NA
delays <- filter(delays, arr_delay == max(arr_delay)) 
print(select(delays, dest))
# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
carriers <- group_by(flights, carrier)
summarize(carriers, mean_delay = mean(carrier))