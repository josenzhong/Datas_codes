library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

amzn <- as.matrix(amzn)
Date <- row.names(amzn)
WeekDay <- weekdays(as.Date(Date))
amzn <- as.data.frame(amzn, row.names=F)
amzn <- cbind(Date, WeekDay, amzn)

amzn.2012 <- amzn[year(amzn$Date) == 2012,]
amzn.2012 <- as.data.frame(as.matrix(amzn.2012), row.names=NULL)
amzn.Mon2012 <- amzn.2012[amzn.2012$WeekDay == "Monday",]

x <- c(nrow(amzn.2012), nrow(amzn.Mon2012))
x