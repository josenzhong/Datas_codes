fileUrl1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1, "./GDP.csv", method = "curl")
download.file(fileUrl2, "./EDU.csv", method = "curl")
gdp <- read.csv("GDP.csv", skip = 4, nrow = 190,
                colClasses=c(NA,NA,"NULL",NA,NA,"NULL","NULL","NULL","NULL","NULL"))
colnames(gdp) = c("ID", "Ranking", "Economy", "USDM")
edu <- read.csv("EDU.csv")
colnames(edu)
mergeData <- merge(gdp, edu, by.x = "ID", by.y = "CountryCode")
mergeData.filt <- mergeData[grepl("^Fiscal year end: [Jj]une", mergeData$Special.Notes),]
nrow(mergeData.filt)