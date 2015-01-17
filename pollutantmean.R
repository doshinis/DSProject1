
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  path <- directory
  
  ## read all the files names in the directory    
  filenames <- list.files(path, pattern = "*.csv")

  ## 'ALLPollutantsVectorFromFiles' Combined vector to hold pollutants vector retrieved from each file 
  ALLPollutantsVectorFromFiles <- vector("integer", 0)
  
  ## start for loop for length of id
  for(i in id){
    
      ## read dataframes from the specific file(i)    
      data1 = read.csv(paste(path, "/", filenames[i], sep = ""))

      ## Extract the data for specified pollutant type only
      PollutantsVectorFromFile <- data1[[pollutant]]
      
      ## concatenate the data from each file into overall single vector
      ALLPollutantsVectorFromFiles <- c(ALLPollutantsVectorFromFiles, PollutantsVectorFromFile)
      
  }
  ## End for loop
  
  ## calculate mean of (vector of mean of pollutant monitors). Discard NA values.
  mean(ALLPollutantsVectorFromFiles, na.rm = TRUE)
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}
