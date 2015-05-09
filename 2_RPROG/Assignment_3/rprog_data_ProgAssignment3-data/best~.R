best <- function(state, outcome) {
        ## Read outcome data
        outcome.complete <- read.csv("outcome-of-care-measures.csv", 
                                     colClasses = "character")
        
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
                                     "heart.attack",
                                     "heart.failure",
                                     "pneumonia")
        
        ## Convert the matrix into data frame
        outcome.short <- as.data.frame(outcome.short)
        
        ## Convert the income into x and assign value to x based on the input
        if(outcome == "heart attack") {
                x <- heart.attack
        } else if(outcome == "heart failure") {
                x <- heart.failure
        } else if(outcome == "pneumonia") {
                x <- pneumonia
        } else {
                print("invalid outcome")
        }
        
        ## Check that state and outcome are valid
        if(!(state %in% outcome.short$State)){
                ## Check that state is valid
                print("invalid state")
        } else {
               ## Create a subset with only the selected state and underlying outcome 
               ## while remove the missing
               outcome.ss <- subset(outcome.short, 
                                    State == "TX" & heart.attack != "Not Available")
               
               ## Convert factor into numeric while preserving the decimal number
               outcome.ss$heart.attack <- as.numeric(levels(outcome.ss$heart.attack)[outcome.ss$heart.attack],
                                                  options(digits = 3))
               
               ## Stort the hospital names in alphabetical order
               outcome.order <- outcome.ss[order(outcome.ss$heart.attack, outcome.ss$Hospital), ]
               
               ## Choose the first hospital in outcome.state.order
               x <- as.matrix(outcome.order[1, ])
               x[, "Hospital"]
               
        }
        
        ## Return hospital name in that state with lowest 30-day death
        
        ## rate
}
