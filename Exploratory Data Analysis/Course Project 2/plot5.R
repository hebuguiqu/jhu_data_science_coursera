# Use ggplot
library(ggplot2)

# Acquire Data
nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

# Summarize Data
baltimore <- subset(nei, fips == "24510")
baltimore_vehicles <- baltimore[baltimore$type == "ON-ROAD", ]
baltimoredata <- aggregate(baltimore_vehicles$Emissions, by = list(baltimore_vehicles$year), FUN = sum)

# Plot
png("plot5.png")
ggplot(baltimoredata, aes(Group.1, x)) + geom_line() + labs(title = "Emissions from Baltimore Motor Vehicles", x = "Year", y = expression("PM" [2.5] ~ "Emitted (tons)"))
dev.off()