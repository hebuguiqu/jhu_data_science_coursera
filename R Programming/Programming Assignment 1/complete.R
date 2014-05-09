complete <- function(directory, id = 1:332) {
  
  result <- data.frame()
  
  for (i in id) {
    
    file <- paste(directory, "/", formatC(i, width=3, flag="0"), ".csv", sep="")
      
    temp <- read.csv(file, header = TRUE)
    
    obs <- sum(complete.cases(temp))

    result <- rbind(result, c(i,obs))
  
  }
  
  names(result) <- c("id","nobs")
  return(result)

}