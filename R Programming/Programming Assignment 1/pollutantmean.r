pollutantmean <- function(directory, pollutant, id = 1:332) {

  count <- 0
  
  for (i in id) {
    
    file <- paste(directory, "/", formatC(i, width=3, flag="0"), ".csv", sep="")
    
    if (count == 0) {
      
      running <- read.csv(file, header = TRUE)
      count <- 1
      
    } else {
      
      temp <- read.csv(file, header = TRUE)
      running <- rbind(temp, running)
      
    }
    
  }
  
  if (pollutant == "sulfate") {
    
    result <- mean(running$sulfate, na.rm = TRUE)
    
  } else {
    
    result <- mean(running$nitrate, na.rm = TRUE)
    
  }
  
  return(result)
  
}