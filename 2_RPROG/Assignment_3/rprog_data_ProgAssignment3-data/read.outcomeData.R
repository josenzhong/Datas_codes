read.outcomeData <- function(data = "outcome-of-care-measures.csv") {
  
  ## Read outcome data
  outcome.complete <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # Create a dateset with only the necessary columns
  outcome.short <- cbind(outcome.complete$Hospital.Name,
                         outcome.complete$State,
                         outcome.complete$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,
                         outcome.complete$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,
                         outcome.complete$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
  
  ## Rename columns
  colnames(outcome.short) <- c("Hospital",
                               "State",
                               "heart.attack",
                               "heart.failure",
                               "pneumonia")
  
  ## Convert the matrix into data frame
  outcome.short <- as.data.frame(outcome.short)
  
  save(outcome.short, file = "outcome.short.RData")
}