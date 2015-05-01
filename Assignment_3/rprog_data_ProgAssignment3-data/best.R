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
                                  "heart attack",
                                  "heart failure",
                                  "pneumonia")
        
        ## Convert the matrix into data frame
        outcome.short <- as.data.frame(outcome.short)
        
        ## Create a vector containing the outcome names
        outcome.names <- c("heart attack", "heart failure", "pneumonia")
        
        ## Check that state and outcome are valid
        if(!(state %in% outcome.short$State)){
                ## Check that state is valid
                print("invalid state")
        } else if(!(outcome %in% outcome.names)){
                ## Check that outcome is valid
                print("invalid outcome")

        } else {
               ## Create a subset with only the selected state 
               outcome.state <- subset(outcome.short, State == "TX")
               
               ## Exclude the row with the missing value of the underlying "outcome"
               attach(outcome.state)
               pneumonia[pneumonia == "Not Available"] <- NA
               outcome.state <- na.omit(outcome.state)
               detach(outcome.state)
               
               ## Stort the hospital names in alphabetical order
               attach(outcome.state)
               outcome.state.order <- outcome.state[order(pneumonia, Hospital), ]
               detach(outcome.state)
               
               ## Choose the first hospital in outcome.state.order
               x <- outcome.state.order$Hospital[1]
               print(x)
        }
        
        ## Return hospital name in that state with lowest 30-day death
        
        ## rate
}
