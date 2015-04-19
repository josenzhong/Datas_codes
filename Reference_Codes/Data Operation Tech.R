## Load csv file, "hw1_data.csv", and assign to a new data, "Q1".
Q1 <- read.csv("hw1_data.csv")

## Extract "Ozone" column to form a new dataset "Ozone".
Ozone <- Q1[, "Ozone"]

## Find the missing dataset on "Ozone" to form a logical dataset called "bad".
bad <- is.na(Ozone)

## To find out how many data in "Ozone" are missing, or in "bad" is true.
# Method 1:
sum(bad)

# Method 2:
table(bad)["TRUE"]

## Find the mean of "Ozone", excluding the missing data.
mean(Ozone[!bad])

## Create a subset "bar" with data on condition when Ozone > 31 and Temp > 90.
bar <- subset(Q1, Ozone > 31 & Temp > 90)

## Extract "Solar.R" column to form a new dataset "Solar.condtions".
Solar.condtions <- bar[, "Solar.R"]

# Find the mean of the dataset "Solar.condtions".
mean(Solar.condtions)

## Extract "Temp" column from dataset "Q1" to form a new dataset based on condition where Month == 6. 
Temp.conditions <- subset(Q1, Month == 6) [, "Temp"]

# Find the mean of the dataset "Temp.conditions".
mean(Temp.conditions)

## Extract "Ozone" column from dataset "Q1" to form a new dataset based on condition where Month == 5. 
Ozone.conditions <- subset(Q1, Month == 5) [, "Ozone"]

# Find the missing value in dataset "Ozone.conditions".
bad2 <- is.na(Ozone.conditions)

# Find the maximum value of dataset "Ozone.conditions" by excluding the missing value.
max(Ozone.conditions[!bad2])

