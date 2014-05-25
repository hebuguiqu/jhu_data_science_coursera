# Use ggplot
library(ggplot2)

# Acquire Data
nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

# Summarize Data
baltimore <- subset(nei, fips == 24510)
baltimoredata <- aggregate(baltimore$Emissions, by = list(baltimore$year, baltimore$type), FUN = sum)

# Plot
png("plot3.png")
ggplot(baltimoredata, aes(Group.1, x)) + geom_line() + facet_grid(. ~ Group.2) + labs(x = "Year", y = expression("PM" [2.5] ~ "Emitted (tons)"))
dev.off()

