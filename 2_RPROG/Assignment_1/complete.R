complete <- function(directory, id = 1:332) {
        ## Set working directory create a files_list of all files in "specdata" directory
        file_list <- list.files("specdata", full.names = TRUE) 
        
        ## Creat empty datasets "airpoldata[i]" and "good" 
        airpoldata <- data.frame()
        data.nobs <-  data.frame()
        
        # Read and rbind the files within the files_list with the underlying "ID" to fill "airpoldata"
        for (i in id) {
                
                ## Read and create individual datasets for each csv files
                airpoldata <- read.csv(file_list[i])
                
                # Create complete cases
                good <- complete.cases(airpoldata)
                airpoldata.complete <- airpoldata[good, ]
                
                # Generate a dataset "data.nobs" containning both id and nobs
                temp <- data.frame(id = i, nobs = nrow(subset(airpoldata.complete, ID == i)))
                data.nobs <- rbind(data.nobs, temp)
                
        }
       
        print (data.nobs)
}

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases