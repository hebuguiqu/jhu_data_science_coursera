# Leverage the sqldf package to read and subset the data in a single operation
require("sqldf")
sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
file <- "household_power_consumption.txt"
data <- read.csv2.sql(file, sql)

# Format the date and time of the data
data$DateTime <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Create png file for Plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# Upper Left Corner
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")
# Upper Right Corner
plot(data$DateTime, data$Voltage, type = "l", xlab = "", ylab= "Voltage", main = "")
# Lower Left Corner
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
# Lower Right Corner
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "", ylab= "Global_rective_power")
dev.off()
