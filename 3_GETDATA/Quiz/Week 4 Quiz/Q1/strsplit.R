download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "./microdata.csv", method = "curl")
microdata <- read.csv("microdata.csv")
tolower(names(microdata))
splitname = strsplit(names(microdata), "wgtp")
splitname[[123]]