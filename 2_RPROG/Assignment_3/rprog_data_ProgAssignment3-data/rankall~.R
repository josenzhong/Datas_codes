rankall <- function(outcome, num = "best") { ## 1
  
  ## Read outcome data
  source("read.outcomeData.R")
  read.outcomeData()
  load("outcome.short.RData")
  file.remove("outcome.short.RData")
  
  ## Check that the outcome is valid
  outcomeVer <- c("heart attack", "heart failure", "pneumonia")
  
  ## StateList
  stateList <- unique(as.character(outcome.short$State))
  stateList <- as.data.frame(stateList)
  state.order <- stateList[order(stateList$stateList), ]
  colnames(stateList) <- c("state")
  save(stateList, file = "stateList.RData")
  
  # NrowState
  nrowState <- nrow(stateList)
  
  
  ##
  outcome.order_2 <- as.data.frame(cbind(NA, NA))
  ##
  
  
  ### 
   if(outcome %in% outcomeVer) { ## 2
     
     if(num <= nrowState) { ## 3
       
       n <- 1
       state <- as.character(stateList[n, ])
       
       for(state %in% nrowState) {
         
         state <- as.character(stateList[n, ])
         n <- n + 1
         
         source("condition.outcome.R")
         condition.outcome("heart attack", state, num)
         load("pick_2.RData")
         file.remove("pick_2.RData")
         
         outcome.order_2 <- rbind(outcome.order_2, pick_2)
         rm("pick_2")
         
       }
       
       
       print(outcome.order_2)
       
     } else {
       print(NA)
     } ## 3
    
   } else {
     stop("invalid outcome")
   } ## 2

} ## 1