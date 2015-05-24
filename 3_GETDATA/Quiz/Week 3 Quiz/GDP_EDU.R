fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1, destfile="./gdp.csv", method="curl")
download.file(fileUrl2, destfile="./edu.csv", method="curl")

# Quiz 3
all_content = readLines("./gdp.csv")
temp =read.csv(textConnection(all_content[5:195]))
gdpData <- temp[c(1, 2, 4, 5)]
colnames(gdpData) <- c("CountryCode", "Ranking", "Long.Name", "GDP$M")
rm(temp, all_content)
eduData <- read.csv("./edu.csv")
gdpData.dec <- gdpData[order(gdpData$Ranking, decreasing=T),]
gdpData.dec[13, "Long.Name"]


# Quiz 4
edushort <- eduData[c(1,3)]
mergedData = merge(edushort, gdpData, by.x = "CountryCode", by.y = "CountryCode", )
mean(mergedData$Ranking[mergedData$Income.Group == "High income: OECD"])
mean(mergedData$Ranking[mergedData$Income.Group == "High income: nonOECD"])

# Quiz 5
mergedData <- mergedData[order(mergedData$Ranking),]
quantiles <- as.data.frame(NA)
colnames(quantiles) <- c("Quantiles")
mergedData <- cbind(mergedData, quantiles)
mergedData$Quantiles[mergedData$Ranking <= 38] <- 1
mergedData$Quantiles[mergedData$Ranking %in% 39:76] <- 2
mergedData$Quantiles[mergedData$Ranking %in% 77:114] <- 3
mergedData$Quantiles[mergedData$Ranking %in% 115:152] <- 4
mergedData$Quantiles[mergedData$Ranking %in% 153:190] <- 5

mergedData.f <- mergedData[(mergedData$Income.Group == "Lower middle income"
                            & mergedData$Quantiles == 1),]
nrow(mergedData.f)
