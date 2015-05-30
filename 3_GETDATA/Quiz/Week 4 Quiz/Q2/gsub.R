fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile = "./GDP.csv", method = "curl")
gdp <- read.csv("GDP.csv", skip = 4, nrow = 190,
                colClasses=c(NA,NA,"NULL",NA,NA,"NULL","NULL","NULL","NULL","NULL"))
colnames(gdp) = c("ID", "Ranking", "Economy", "USDM")
USDM.fixed <- gsub(",", "", gdp$USDM)
mean(as.numeric(USDM.fixed))