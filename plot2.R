elec <- read.csv2("household_power_consumption.txt")
foo <- subset(elec, as.Date(Date, format = "%d/%m/%Y") %in%
                  c(as.Date("2007-02-01"), as.Date("2007-02-02")))
# FIXME: Need to fix x axis scale, labels
plot(as.numeric(as.character(foo$Global_active_power)),
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n",
     xlab = "")
pow_len <- length(foo$Global_active_power)
axis(1, at=c(0,pow_len/2, pow_len), labels=c("Thu", "Fri", "Sat"))
dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()
