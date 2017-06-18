# Load the raw data
elec <- read.csv2("household_power_consumption.txt")
# Filter out the days in question, 2007-02-01 and 2007-02-02
days <- subset(elec, as.Date(Date, format = "%d/%m/%Y") %in%
                  c(as.Date("2007-02-01"), as.Date("2007-02-02")))
# Make sure we're plotting only one graph, just in case we have a
# stale grid left over from plot4
par(mfrow = c(1,1))
hist(as.numeric(as.character(days$Global_active_power)),
     breaks = 12,
     col = "red",
     xaxt = "n",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
# Format the x axis like in the example
axis(1, at=c(0,2,4,6), labels=c(0,2,4,6))
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()
