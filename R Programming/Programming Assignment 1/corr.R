corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  result <- data.frame()
  
  for (i in 1:332) {
    
    file <- paste(directory, "/", formatC(i, width=3, flag="0"), ".csv", sep="")
    
    temp <- read.csv(file, header = TRUE)
    
    obs <- sum(complete.cases(temp))
    
    corr <- cor(temp$sulfate,temp$nitrate, use="pairwise.complete.obs")
    
    result <- rbind(result, c(i,obs,corr))
    
  }
  
  names(result) <- c("id","nobs","corr")
  
  thresholded <- subset(result, nobs > threshold)
  
  return(thresholded$corr)
  
}