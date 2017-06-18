# Our plot3, captured here as a function to be called when we need it.
# The parameter 'days' contains the data for 2007-02-01 and 2007-02-02
plot3 <- function(days) {
    yrange <- range(as.character(days$Sub_metering_1,
                                 days$Sub_metering_2,
                                 days$Sub_metering_3))
    xrange <- range(1:length(days$Sub_metering_1))
    plot(xrange, yrange, type = "n",
         ylab = "Energy sub metering",
         xaxt = "n",
         xlab = "")
    legend("topright",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"),
           lty = 1,
           y.intersp = 0.3,
           cex = 0.7,
           bty = "n")
    points(as.numeric(as.character(days$Sub_metering_1)), type = "l")
    points(as.numeric(as.character(days$Sub_metering_2)), type = "l",
           col = "red")
    points(as.numeric(as.character(days$Sub_metering_3)), type = "l",
           col = "blue")
    # Grab the length of the x axis to help calculate where to put
    # the x axis labels
    pow_len <- length(days$Sub_metering_1)
    # Label the start of the x axis "Thu", the middle "Fri", and the end "Sat"
    axis(1, at=c(0,pow_len/2, pow_len), labels=c("Thu", "Fri", "Sat"))
}
# Load the raw data
elec <- read.csv2("household_power_consumption.txt")
# Filter out the days in question, 2007-02-01 and 2007-02-02
days <- subset(elec, as.Date(Date, format = "%d/%m/%Y") %in%
                  c(as.Date("2007-02-01"), as.Date("2007-02-02")))
# There will be a total of four graphs in a 2x2 grid
par(mfrow=c(2,2))

# Graph 1, top left
plot(as.numeric(as.character(days$Global_active_power)),
     type = "l",
     ylab = "Global Active Power",
     xaxt = "n",
     xlab = "")
# Grab the length of the x axis to help calculate where to put
# the x axis labels
pow_len <- length(days$Global_active_power)
# Label the start of the x axis "Thu", the middle "Fri", and the end "Sat"
axis(1, at=c(0,pow_len/2, pow_len), labels=c("Thu", "Fri", "Sat"))

# Graph 2, top right, from plot2 of our homework
plot(as.numeric(as.character(days$Voltage)),
     type = "l",
     ylab = "Voltage",
     xaxt = "n",
     xlab = "datetime")
# Grab the length of the x axis to help calculate where to put
# the x axis labels
pow_len <- length(days$Voltage)
# Label the start of the x axis "Thu", the middle "Fri", and the end "Sat"
axis(1, at=c(0,pow_len/2, pow_len), labels=c("Thu", "Fri", "Sat"))


# Graph 3, bottom left, from plot3 of our homework
plot3(days)

# Graph 4, bottom right
plot(as.numeric(as.character(days$Global_reactive_power)),
     type = "l",
     ylab = "Global_reactive_power",
     xaxt = "n",
     xlab = "datetime")
# Grab the length of the x axis to help calculate where to put
# the x axis labels
pow_len <- length(days$Global_reactive_power)
# Label the start of the x axis "Thu", the middle "Fri", and the end "Sat"
axis(1, at=c(0,pow_len/2, pow_len), labels=c("Thu", "Fri", "Sat"))

dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()

