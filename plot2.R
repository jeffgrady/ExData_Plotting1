# Load the raw data
elec <- read.csv2("household_power_consumption.txt")
# Filter out the days in question, 2007-02-01 and 2007-02-02
days <- subset(elec, as.Date(Date, format = "%d/%m/%Y") %in%
                  c(as.Date("2007-02-01"), as.Date("2007-02-02")))
# Make sure we're plotting only one graph, just in case we have a
# stale grid left over from plot4
par(mfrow = c(1,1))
plot(as.numeric(as.character(days$Global_active_power)),
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n",
     xlab = "")
# Grab the length of the x axis to help calculate where to put
# the x axis labels
pow_len <- length(days$Global_active_power)
# Label the start of the x axis "Thu", the middle "Fri", and the end "Sat"
axis(1, at=c(0,pow_len/2, pow_len), labels=c("Thu", "Fri", "Sat"))
dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()
