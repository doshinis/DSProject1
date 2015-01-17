complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  nobs <- vector("numeric", 0)
  
  path <- directory
  
  ## read all the files names in the directory    
  filenames <- list.files(path, pattern = "*.csv")
  
  ## start for loop for length of id
  for(i in id){
    
    ## read dataframes from the specific file(i)    
    
    data1 = read.csv(paste(path, "/", filenames[i], sep = ""))
    
    data1NoNA = complete.cases(data1)
    ##print(filenames[i])
    nobs <- c(nobs, sum(data1NoNA))
    
  }
  ## End for loop
  
  compCasesFrame <- data.frame(id, nobs)
  names(compCasesFrame) <- c("id", "nobs")
  
  compCasesFrame
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}