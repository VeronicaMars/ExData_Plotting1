#read data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
#filter useful data
library(dplyr)
DT <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
#set graphic device
png(filename = "plot4.png", width = 480, height = 480)
#plotting
DT$datetime <- as.POSIXct(paste(DT$Date, DT$Time), format = "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))
with(DT, plot(datetime, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power(kilowatts)"))
with(DT, plot(datetime, Voltage, type = "l"))
with(DT, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(DT, lines(datetime, Sub_metering_1, col = "black"))
with(DT, lines(datetime, Sub_metering_2, col = "red"))
with(DT, lines(datetime, Sub_metering_3, col = "blue"))
with(DT, plot(datetime, Global_reactive_power, type = "l"))
#shut down device
dev.off()

