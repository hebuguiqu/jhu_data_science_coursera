# Use ggplot
library(ggplot2)

# Acquire Data
nei <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
scc <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

# Summarize Data
baltimore_losangeles <- nei[nei$fips == "24510" | nei$fips == "06037", ]
bla_vehicles <- baltimore_losangeles[baltimore_losangeles$type == "ON-ROAD", ]
bla_data <- aggregate(bla_vehicles$Emissions, by = list(bla_vehicles$year, bla_vehicles$fips), FUN = sum)
bla_data$Group.2 <- factor(bla_data$Group.2, labels = c("Los Angeles", "Baltimore"))

# Plot
png("plot6.png")
ggplot(bla_data, aes(Group.1, x, colour = Group.2)) +
  geom_line() +
  labs(title = "Motor Vehicle Emissions for Los Angeles and Baltimore", x = "Year", y = expression("Change in PM" [2.5] ~ "Emitted (tons)")) +
  theme(legend.title = element_blank())
dev.off()