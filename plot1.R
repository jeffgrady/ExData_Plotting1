elec <- read.csv2("household_power_consumption.txt")
foo <- subset(elec, as.Date(Date, format = "%d/%m/%Y") %in%
                  c(as.Date("2007-02-01"), as.Date("2007-02-02")))
# FIXME: Need to fix x axis scale, labels
hist(as.numeric(as.character(foo$Global_active_power)),
     breaks = 12,
     xlim = c(0,6),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()
