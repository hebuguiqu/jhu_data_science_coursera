# Question 1

q1data <- read.csv("getdata_data_ss06hid.csv", header=TRUE)
splitnames <- strsplit(names(q1data),"wgtp")
splitnames[123]

# Question 2

q2data <- read.csv("getdata_data_GDP.csv",skip=4)
names(q2data) <- c("shortcode", "rank", "X.2","longname","GDP","X.5","X.6","X.7","X.8","X.9")
q2data$rank <- as.integer(as.character(q2data$rank))
q2dataranked <- q2data[!is.na(q2data$rank),]
results <- as.integer(gsub(",","",q2dataranked$GDP))
mean(results)

# Question 3

countryNames <- as.character(q2dataranked$longname)
countryNames[99] <- "ERROR" #correct for formatting
countryNames[186] <- "ERROR" #correct for formatting

length(grep("^United",countryNames))

# Question 4

q4dataed <- read.csv("getdata_data_EDSTATS_Country.csv")
q4datamerge <- merge(q2dataranked,q4dataed,by.x="shortcode",by.y="CountryCode")
# Data is in q4datamerge$Special.Notes
length(grep("*end: June*",q4datamerge$Special.Notes))

# Question 5

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
length(grep("2012",sampleTimes))