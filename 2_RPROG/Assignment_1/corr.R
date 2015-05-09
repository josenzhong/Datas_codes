corr <- function(directory, threshold = 0) {
        ## Set working directory create a files_list of all files in "specdata" directory
        file_list <- list.files("specdata", full.names = TRUE) 
        
        ## Creat empty datasets "airpoldata[i]", "good", and "corr"
        airpoldata <- data.frame()
        data.nobs <-  data.frame()
        
        # Read and rbind the files within the files_list with the underlying "ID" to fill "airpoldata"
        for (i in 1:332) {
                
                ## Read and create individual datasets for each csv files
                airpoldata <- read.csv(file_list[i])
                
                # Create complete cases
                good <- complete.cases(airpoldata)
                airpoldata.complete <- airpoldata[good, ] 
                
                # Create "dat" to contain temperary data which stores both sulfate and nitrate with ID == i
                dat <- subset(airpoldata.complete, ID == i)
                dat <- subset(dat, select = c("sulfate", "nitrate"))
                
                # Calculate the correlation between sulfate and nitrate
                temp <- data.frame(id = i, 
                                   nobs = nrow(subset(airpoldata.complete, ID == i)),
                                   corr = cor(dat$sulfate, dat$nitrate))
                
                # Generate a dataset "data.nobs" containning "id", "nobs", and "corr"
                # And including only the rows which have nobs greater than threshold
                if (temp$nobs > threshold) {
                        data.nobs <- rbind(data.nobs, temp)                        
                } 
        }                    
        
        # Extract "corr" to form a single column dataset
        
        if (length(data.nobs) == 0) {
                data.corr <- vector("numeric", length = 0)
        } else {
                data.corr <- as.numeric(data.matrix(subset(data.nobs, select = c("corr"))))
        }
        
}

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations