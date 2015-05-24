library(xlsx)
dat <- read.xlsx("getdata_data_DATA.gov_NGAP.xlsx", sheetIndex=1, header=T, colIndex=7:15, rowIndex=18:23)
sum(dat$Zip*dat$Ext,na.rm=T)
