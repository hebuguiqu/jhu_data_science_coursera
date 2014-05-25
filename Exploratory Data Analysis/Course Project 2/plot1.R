# Acquire Data
nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

# Summarize Data
data <- aggregate(nei$Emissions, by = list(nei$year), FUN = sum)

# Plot
png("plot1.png")
plot(data, type = "l", main = "Total Emissions in the US", xlab = "Year", ylab = expression("PM" [2.5]~~ "emitted(tons)"))
dev.off()