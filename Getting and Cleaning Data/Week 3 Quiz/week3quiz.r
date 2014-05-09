# Question 1

q1data <- read.csv("getdata_data_ss06hid.csv")
agricultureLogical <- q1data$ACR == 3 & q1data$AGS == 6
which(agricultureLogical)

# Question 2

library(jpeg)
q2jpeg <- readJPEG("getdata_jeff.jpg", native = TRUE)
quantile(q2jpeg, probs = c(0.3,0.8))

# Question 3

q3data1 <- read.csv("getdata_data_GDP.csv",skip=4)
q3data2 <- read.csv("getdata_data_EDSTATS_Country.csv")
names(q3data1) <- c("shortcode", "rank", "X.2","longname","GDP","X.5","X.6","X.7","X.8","X.9")
q3data1$rank <- as.integer(as.character(q3data1$rank))
q3data1ranked <- q3data1[!is.na(q3data1$rank),]
q3datamerge <- merge(q3data1ranked,q3data2,by.x="shortcode",by.y="CountryCode")
q3datamerge[order(-q3datamerge[2.]),1:3]

# Question 4

q4data <- q3datamerge[,c(2,4,12)]
q4dataOECD <- q4data[q4data$Income.Group == "High income: OECD",]
q4datanonOECD <- q4data[q4data$Income.Group == "High income: nonOECD",]
mean(as.numeric(q4dataOECD$rank))
mean(as.numeric(q4datanonOECD$rank))

# Question 5

q5data <- q4data
q5data$quantile <- cut(q5data$rank,breaks=5)
q5table <- table(q5data$Income.Group,q5data$quantile)
