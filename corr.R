corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  
  path <- directory

  ## final result vector to hold cor for each monitor / file
  corVector = vector("numeric", 0)
  
  ## read all the files names in the directory    
  filenames <- list.files(path, pattern = "*.csv")
  
  ## start for loop for length of id
  for(file in filenames){
    
    ## read dataframes from the specific / each file   
    data1 = read.csv(paste(path, "/", file, sep = ""))
    
    ## identify complete cases   
    data1NoNA = complete.cases(data1)
    
    if(sum(data1NoNA) > threshold){

      ## only if number of cases is above threshould, 
      ## get Sulfate and nitrate as separate vectors   
      
      sulfateVector <- data1[data1NoNA, ]$sulfate
      nitrateVector <- data1[data1NoNA, ]$nitrate

      ## calculate cor for two vectors, append cor to result vector
      corVector <- c(corVector, cor(sulfateVector, nitrateVector))
      
    }
        
  }
  corVector
  ## Return a numeric vector of correlations
}