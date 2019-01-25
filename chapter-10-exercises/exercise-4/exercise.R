# Exercise 4: external data sets: Gates Foundation Educational Grants

# Use the `read.csv()` functoin to read the data from the `data/gates_money.csv`
# file into a variable called `grants` using the `read.csv()`
# Be sure to set your working directory in RStudio, and do NOT treat strings as 
# factors!
gates_data <- read.csv("data/gates_money.csv", stringsAsFactors = FALSE)

# Use the View function to look at the loaded data
View(gates_data)

# Create a variable `organization` that contains the `organization` column of 
# the dataset
organization <- gates_data$organization

# Confirm that the "organization" column is a vector using the `is.vector()` 
# function. 
# This is a useful debugging tip if you hit errors later!
is.vector(organization)

## Now you can ask some interesting questions about the dataset

# What was the mean grant value?
print(mean(gates_data$total_amount))

# What was the dollar amount of the largest grant?
print(max(gates_data$total_amount))

# What was the dollar amount of the smallest grant?
print(min(gates_data$total_amount))

# Which organization received the largest grant?
print(organization[which.max(gates_data$total_amount)])

# Which organization received the smallest grant?
print(organization[which.min(gates_data$total_amount)])

# How many grants were awarded in 2010?
inTargetYear <- gates_data$start_year == 2010
print(length(gates_data$id[inTargetYear]))