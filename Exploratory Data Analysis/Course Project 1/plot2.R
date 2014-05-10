# Leverage the sqldf package to read and subset the data in a single operation
require("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
file <- "household_power_consumption.txt"
data <- read.csv2.sql(file, sql)

# Format the date and time of the data
data$DateTime <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Create png file for Plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)", main = "")
dev.off()