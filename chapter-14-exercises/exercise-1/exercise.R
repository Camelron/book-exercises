# Exercise 1: reading and querying a web API

# Load the httr and jsonlite libraries for accessing data
# You can also load `dplyr` if you wish to use it
install.packages("httr")
install.packages("jsonlite")

library("dplyr")
library("httr")
library("jsonlite")
# Create a variable base_uri that stores the base URI (as a string) for the 
# Github API (https://api.github.com)
base_uri <- "https://api.github.com"

# Under the "Repositories" category of the API documentation, find the endpoint 
# that will list _repos in an organization_. Then create a variable named
# `org_resource` that stores the endpoint for the `programming-for-data-science`
# organization repos (this is the _path_ to the resource of interest).
org_resource <- "/orgs/programming-for-data-science/repos"

# Send a GET request to this endpoint (the `base_uri` followed by the 
# `org_resource` path). Print the response to show that your request worked. 
# (The listed URI will also allow you to inspect the JSON in the browser easily).
response <- GET(paste(base_uri, org_resource, sep=""))
print(response)
# Extract the content of the response using the `content()` function, saving it
# in a variable.
body <- content(response, "text")

# Convert the content variable from a JSON string into a data frame.
data <- fromJSON(body)
View(data)
# How many (public) repositories does the organization have?
data_public <- filter(data, private == FALSE)
print(length(data_public$id))

# Now a second query:
# Create a variable `search_endpoint` that stores the endpoint used to search 
# for repositories. (Hint: look for a "Search" endpoint in the documentation).
search_endpoint <- "/search/repositories?"

# Search queries require a query parameter (for what to search for). Create a 
# `query_params` list variable that specifies an appropriate key and value for 
# the search term (you can search for anything you want!)
query_params <- list(q = "dplyr")

# Send a GET request to the `search_endpoint`--including your params list as the
# `query`. Print the response to show that your request worked.
search <- GET(paste(base_uri, search_endpoint, sep=""), query = query_params)
print(search)
# Extract the content of the response and convert it from a JSON string into a
# data frame. 
body <- content(search, "text")
data2 <- fromJSON(body)
View(data2)
data3 <- data2$items
View(data3)
# How many search repos did your search find? (Hint: check the list names to 
# find an appropriate value).
print(length(data3$id))

# What are the full names of the top 5 repos in the search results?
data3 <- mutate(data3, number = c(1:30)) %>% 
  filter(number < 6)
print(data3$full_name)