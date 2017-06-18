# Load the raw data
elec <- read.csv2("household_power_consumption.txt")
# Filter out the days in question, 2007-02-01 and 2007-02-02
days <- subset(elec, as.Date(Date, format = "%d/%m/%Y") %in%
                  c(as.Date("2007-02-01"), as.Date("2007-02-02")))
# Calculate the ranges for our (at first) empty plot
yrange <- range(as.character(days$Sub_metering_1,
                             days$Sub_metering_2,
                             days$Sub_metering_3))
xrange <- range(1:length(days$Sub_metering_1))
# Make sure we're plotting only one graph, just in case we have a
# stale grid left over from plot4
par(mfrow = c(1,1))
plot(xrange, yrange, type = "n",
     ylab = "Energy sub metering",
     xaxt = "n",
     xlab = "")
legend("topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lty = 1,
    y.intersp = 0.5,
    cex = 0.75 )
points(as.numeric(as.character(days$Sub_metering_1)), type = "l")
points(as.numeric(as.character(days$Sub_metering_2)), type = "l", col = "red")
points(as.numeric(as.character(days$Sub_metering_3)), type = "l", col = "blue")
# Grab the length of the x axis to help calculate where to put
# the x axis labels
pow_len <- length(days$Sub_metering_1)
# Label the start of the x axis "Thu", the middle "Fri", and the end "Sat"
axis(1, at=c(0,pow_len/2, pow_len), labels=c("Thu", "Fri", "Sat"))
dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()
