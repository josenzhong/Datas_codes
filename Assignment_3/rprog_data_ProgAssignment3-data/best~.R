best <- function(state, outcome) {
        ## Read outcome data
        outcome.complete <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Create a dateset with only the necessary columns
        outcome.short <- cbind(
                outcome.complete$Hospital.Name,
                outcome.complete$State,
                outcome.complete$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,
                outcome.complete$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,
                outcome.complete$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
        
        ## Rename columns
        colnames(outcome.short) <- c("Hospital",
                                  "State",
                                  "Heart.Attack",
                                  "Heart.Failure",
                                  "Pneumonia")
        
        ## Convert the matrix into data frame
        outcome.short <- as.data.frame(outcome.short)
        
        ## Create a vector containing the outcome names
        outcome.names <- c("Heart.Attack", "Heart.Failure", "Pneumonia")
        
        ## Check that state and outcome are valid
        if(!(state %in% outcome.short$State)){
                ## Check that state is valid
                stop("invalid state")
                
        } else if(!(outcome %in% outcome.names)){
                ## Check that outcome is valid
                stop("invalid outcome")
                
        } else {
               ## Create a subset with only the selected state 
               outcome.state <- subset(outcome.short, State == state)
               
               ## Exclude the row with the missing value of the underlying "outcome"
               outcome.state$outcome[outcome.state$outcome == "Not Available"] <- NA
               outcome.state <- na.omit(outcome.state)
               
               ## Stort the hospital names in alphabetical order
               attach(outcome.state)
               outcome.state.order <- outcome.state[order(outcome, Hospital), ]
               detach(outcome.state)
               
               ## Choose the first hospital in outcome.state.order
               minHospital = outcome.state.order[, "Hospital"]
               minHospital[1]
               
        } 
        
        ## Return hospital name in that state with lowest 30-day death
        
        ## rate
}