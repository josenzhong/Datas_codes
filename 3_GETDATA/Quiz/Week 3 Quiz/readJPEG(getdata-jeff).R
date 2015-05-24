x <- readJPEG("getdata-jeff.jpg", native = TRUE)
quantile(x, c(.30, .80))