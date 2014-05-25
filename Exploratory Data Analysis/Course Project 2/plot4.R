# Use ggplot
library(ggplot2)

# Acquire Data
nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

# Summarize Data
coalscc <- scc[scc$EI.Sector == "Fuel Comb - Electric Generation - Coal" |
                 scc$EI.Sector == "Fuel Comb - Comm/Institutional - Coal" |
                 scc$EI.Sector == "Fuel Comb - Industrial Boilers, ICEs - Coal",]
coalsccnames <- unique(coalscc$SCC)
coal <- nei[nei$SCC %in% coalsccnames, ]
coaldata <- aggregate(coal$Emissions, by = list(coal$year), FUN = sum)

# Plot
png("plot4.png")
ggplot(coaldata, aes(Group.1, x)) + geom_line() + labs(title = "Emissions from Coal", x = "Year", y = expression("PM" [2.5] ~ "Emitted (tons)"))
dev.off()