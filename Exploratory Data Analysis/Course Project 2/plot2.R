# Acquire Data
nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

# Summarize Data
baltimore <- subset(nei, fips == 24510)
baltimoredata <- aggregate(baltimore$Emissions, by = list(baltimore$year), FUN = sum)

# Plot
png("plot2.png")
plot(baltimoredata, type = "l", main = "Total Emissions in Baltimore", xlab = "Year", ylab = expression("PM" [2.5]~~ "emitted(tons)"))
dev.off()