# Leverage the sqldf package to read and subset the data in a single operation
require("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
file <- "household_power_consumption.txt"
data <- read.csv2.sql(file, sql)

# Create png file for Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col= "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", ylim = c(0,1200))
dev.off()