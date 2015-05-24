data <- read.fwf(
  file = "getdata_wksst8110.for",
  skip = 4,
  widths = c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4))
sum(data[, 4])
