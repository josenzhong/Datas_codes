fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./microdata_2006.csv", method="curl")
microdata <- read.csv("./microdata_2006.csv")

## ACR is the Lot Size (3 .House on ten or more acres)
## AGS is the Sales of Agriculture Products (6 .$10000+)
microdata.f <- microdata[which(microdata$ACR == 3 & microdata$AGS == 6),]
agricultureLogical <- microdata$ACR == 3 & microdata$AGS == 6
which(agricultureLogical)