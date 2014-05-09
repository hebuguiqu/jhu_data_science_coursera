#Question 1

#Question 2

library(sqldf)

acs <- read.csv("getdata_data_ss06pid.csv")

sqldf("select pwgtp1 from acs where AGEP < 50")

#Question 3

sqldf("select distinct AGEP from acs")

#Question 4

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
result <- readLines(con, n = 100)
nchar(result[10])
nchar(result[20])
nchar(result[30])
nchar(result[100])

#Question 5

data <- read.fwf("getdata_wksst8110.for", widths=c(10,-5,4,4,-5,4,4,-5,4,4,-5,4,4),header=FALSE, skip=4)

sum(data$V4)