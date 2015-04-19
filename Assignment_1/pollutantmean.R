pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        ## Set working directory create a files_list of all files in "specdata" directory
        file_list <- list.files("specdata", full.names = TRUE) 
    
        ## Creat an empty data "airpoldata"    
        airpoldata <- data.frame()
        
        # read and rbind the files within the files_list with the underlying "ID" to fill "airpoldata"
        for (i in id) {
                airpoldata <- rbind( airpoldata, read.csv(file_list[i]) )
        }
        
        ## Create a subset of column dataset of the underlying "pollutant"        
        col <- subset(airpoldata, select = c(pollutant))
        
        ## Exclude missing value
        col <- col[complete.cases(col),]
        
        ## Convert the subset "pollutant" into numeric matrix
        col <- as.numeric(as.matrix(col))
        
        ## Calculate the mean of the pollutant
        mean(col)
}

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
