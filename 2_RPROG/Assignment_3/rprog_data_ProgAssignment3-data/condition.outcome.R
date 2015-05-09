condition.outcome <- function(outcome, state, num) {
  
  
  if(outcome == "heart attack") {
     
    ## heart.attack
    outcome.ss <- subset(outcome.short, 
                         State == state & heart.attack != "Not Available")
    outcome.ss$x <- as.numeric(levels(outcome.ss$heart.attack)[outcome.ss$heart.attack],
                               options(digits = 5))
    save(outcome.ss, file = "outcome.ss.RData")
    
    ##
    outcome.order <- outcome.ss[order(outcome.ss$heart.attack,
                                      outcome.ss$Hospital), ]
    save(outcome.order, file = "outcome.order.RData")
    
    ##
    if(num <= nrow(outcome.order)){
      pick <- outcome.order[num, ]
      attach(pick)
      pick_2 <- as.data.frame(cbind(as.character(Hospital), as.character(State)))
      detach(pick)
    } else {
      pick_2 <- as.data.frame(cbind("<NA>", "TX"))
    }
    
    
  } else if(outcome == "heart failure") {
    
    ## heart.failure
    outcome.ss <- subset(outcome.short, 
                         State == state & heart.failure != "Not Available")
    outcome.ss$heart.failure <- as.numeric(levels(outcome.ss$heart.failure)[outcome.ss$heart.failure],
                               options(digits = 5))
    save(outcome.ss, file = "outcome.ss.RData")
    
    ##
    outcome.order <- outcome.ss[order(outcome.ss$heart.failure,
                                      outcome.ss$Hospital), ]
    save(outcome.order, file = "outcome.order.RData")
    
    ##
    if(num <= nrow(outcome.order)){
      pick <- outcome.order[num, ]
      attach(pick)
      pick_2 <- as.data.frame(cbind(as.character(Hospital), as.character(State)))
      detach(pick)
    } else {
      pick_2 <- as.data.frame(cbind("<NA>", "TX"))
    }
    
    
  } else if(outcome == "pneumonia") {
    
    ## pneumonia
    outcome.ss <- subset(outcome.short, 
                         State == state & pneumonia != "Not Available")
    outcome.ss$pneumonia <- as.numeric(levels(outcome.ss$pneumonia)[outcome.ss$pneumonia],
                               options(digits = 5))
    save(outcome.ss, file = "outcome.ss.RData")
    
    ##
    outcome.order <- outcome.ss[order(outcome.ss$pneumonia,
                                      outcome.ss$Hospital), ]
    save(outcome.order, file = "outcome.order.RData")
    
    ##
    if(num == "best") { num <- 1 }
    if(num == "worst") { num <- nrow(outcome.order) }
    
    ##
    if(num <= nrow(outcome.order)){
      pick <- outcome.order[num, ]
      attach(pick)
      pick_2 <- as.data.frame(cbind(as.character(Hospital), as.character(State)))
      detach(pick)
    } else {
      pick_2 <- as.data.frame(cbind("<NA>", "TX"))
    }
    
  }
  
  ##
  
  save(pick_2, file = "pick_2.RData")
  

}