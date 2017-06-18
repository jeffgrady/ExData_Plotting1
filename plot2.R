elec <- read.csv2("household_power_consumption.txt")
foo <- subset(elec, as.Date(Date, format = "%d/%m/%Y") %in%
                  c(as.Date("2007-02-01"), as.Date("2007-02-02")))
# FIXME: Need to fix x axis scale, labels
plot(as.numeric(as.character(foo$Global_active_power)),
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()
