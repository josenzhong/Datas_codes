stateCal <- function(outcome, num) {
  
  ## StateList
  stateList <- unique(as.character(outcome.short$State))
  stateList <- as.data.frame(stateList)
  state.order <- stateList[order(stateList$stateList), ]
  colnames(stateList) <- c("state")
  save(stateList, file = "stateList.RData")
  
  ## NrowState
  nrowState <- nrow(stateList)
  n <- NA
  
  for(n <= nrowState) {
    
    n <- n+1
    state <- as.character(stateList[n, ])
    source("condition.outcome.R")
    condition.outcome(outcome, state, num)
    
    ##-----------------------------------
    load("stateList.RData")
    load("outcome.ss.RData")
    load("outcome.order.RData")
    load("outcome.order_2.RData")
    load("pick_2.RData")
    ##
    file.remove("stateList.RData")
    file.remove("outcome.ss.RData")
    file.remove("outcome.order.RData")
    file.remove("outcome.order_2.RData")
    file.remove("pick_2.RData")
    ##------------------------------------
    
    outcome.order_2 <- as.data.frame(NA)
    outcome.order_2 <- rbind(outcome.order_2, pick_2)
    rm("pick_2")
    
  }
  
  ##-------
  colnames(outcome.order_2) <- c("hospital", "state")
  length <- nrow(outcome.order_2)
  
  save(length, file = "length.RData")
  save(outcome.order_2, file = "outcome.order_2.RData")
  
}