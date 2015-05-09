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
        
        ### 
        if(!(state %in% outcome.short$State)){
                
                ## Check that state is valid
                stop("invalid state")
                
        } else if(outcome == "heart attack") {
                
                outcome.ss <- subset(outcome.short, 
                                     State == state & heart.attack != "Not Available")
                
                outcome.ss$heart.attack <- as.numeric(levels(outcome.ss$heart.attack)[outcome.ss$heart.attack],
                                                      options(digits = 5))
                
                outcome.order <- outcome.ss[order(outcome.ss$heart.attack, outcome.ss$Hospital), ]
                
        } else if(outcome == "heart failure") {
                
                outcome.ss <- subset(outcome.short, 
                                     State == state & heart.failure != "Not Available")
                
                outcome.ss$heart.failure <- as.numeric(levels(outcome.ss$heart.failure)[outcome.ss$heart.failure],
                                                      options(digits = 5))
                
                outcome.order <- outcome.ss[order(outcome.ss$heart.failure, outcome.ss$Hospital), ]
                
        } else if(outcome == "pneumonia") {
                
                outcome.ss <- subset(outcome.short, 
                                     State == state & pneumonia != "Not Available")
                
                outcome.ss$pneumonia <- as.numeric(levels(outcome.ss$pneumonia)[outcome.ss$pneumonia],
                                                      options(digits = 5))
                
                outcome.order <- outcome.ss[order(outcome.ss$pneumonia, outcome.ss$Hospital), ]
                
        } else {
                
                stop("invalid outcome")
                
        }
        
        ## Choose the first hospital in outcome.state.order
        x <- as.matrix(outcome.order[1, ])
        x[, "Hospital"]
        
}