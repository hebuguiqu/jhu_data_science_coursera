# Leverage the sqldf package to read and subset the data in a single operation
require("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
file <- "household_power_consumption.txt"
data <- read.csv2.sql(file, sql)

# Format the date and time of the data
data$DateTime <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Create png file for Plot 3
png(filename = "plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
dev.off()