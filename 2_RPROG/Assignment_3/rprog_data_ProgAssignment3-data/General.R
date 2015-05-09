## 1.Plot the 30-day mortality rates for heart attack
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])

## 2.Finding the best hospital in a state

best <- function(state, outcome) {
        ## Read outcome data
        outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if(state !in outcome$State){
                ## Check that state is valid
                print(“invalid state”)
                
        } else if{
                
                
                
        }
        ## Return hospital name in that state with lowest 30-day death
        
        ## rate
}