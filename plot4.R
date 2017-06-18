plot3 <- function() {
    yrange <- range(as.character(foo$Sub_metering_1,
                                 foo$Sub_metering_2,
                                 foo$Sub_metering_3))
    xrange <- range(1:length(foo$Sub_metering_1))
    # FIXME: Need to fix x axis scale, labels
    plot(xrange, yrange, type = "n",
         ylab = "Energy sub metering",
         xlab = "")
    # FIXME:  the legend really needs to be smaller.  figure out how to do that.
    legend("topright",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"),
           lty = 1)
    points(as.numeric(as.character(foo$Sub_metering_1)), type = "l")
    points(as.numeric(as.character(foo$Sub_metering_2)), type = "l", col = "red")
    points(as.numeric(as.character(foo$Sub_metering_3)), type = "l", col = "blue")
}

elec <- read.csv2("household_power_consumption.txt")
foo <- subset(elec, as.Date(Date, format = "%d/%m/%Y") %in%
                  c(as.Date("2007-02-01"), as.Date("2007-02-02")))
par(mfrow=c(2,2))
# FIXME: Need to fix x axis scale, labels
plot(as.numeric(as.character(foo$Global_active_power)),
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
###################
plot(as.numeric(as.character(foo$Voltage)),
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")
###################
plot3()
###################
plot(as.numeric(as.character(foo$Global_reactive_power)),
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")
dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()

