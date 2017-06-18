elec <- read.csv2("household_power_consumption.txt")
foo <- subset(elec, as.Date(Date, format = "%d/%m/%Y") %in%
                  c(as.Date("2007-02-01"), as.Date("2007-02-02")))
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
    lty = 1,
    cex = 0.75 )
points(as.numeric(as.character(foo$Sub_metering_1)), type = "l")
points(as.numeric(as.character(foo$Sub_metering_2)), type = "l", col = "red")
points(as.numeric(as.character(foo$Sub_metering_3)), type = "l", col = "blue")
dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()
