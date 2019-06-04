png(filename = "plot4.png", width = 480, height = 480)
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power_1_2_feb <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power_1_2_feb$period <- paste(power_1_2_feb$Date, power_1_2_feb$Time)
curr <- strptime(power_1_2_feb$period, format = "%d/%m/%Y %H:%M:%S")
final_power<-cbind(power_1_2_feb, curr)
par(mfrow=c(2,2))
#1
plot(as.numeric(final_power$curr), as.numeric(final_power$Global_active_power), type = "l", ylab = "Global Active Power", xlab = " ", main = " ", xaxt = "n")
axis(side=1,at= c(unclass(as.POSIXct("2007-02-01 0:00:00")),unclass(as.POSIXct("2007-02-02 0:00:00")),unclass(as.POSIXct("2007-02-03 0:00:00"))), labels = c("Thu", "Fri", "Sat"))

#2
plot(as.numeric(final_power$curr), as.numeric(final_power$Voltage), type = "l", ylab = "Voltage", xlab = "datetime", main = " ", xaxt = "n")
axis(side=1,at= c(unclass(as.POSIXct("2007-02-01 0:00:00")),unclass(as.POSIXct("2007-02-02 0:00:00")),unclass(as.POSIXct("2007-02-03 0:00:00"))), labels = c("Thu", "Fri", "Sat"))

#3
plot(as.numeric(final_power$curr), as.numeric(final_power$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = " ", main = " ", xaxt = "n")
lines(as.numeric(final_power$curr), as.numeric(final_power$Sub_metering_2), type = "l", ylab = "Energy sub metering", xlab = " ", main = " ", xaxt = "n", col="red")
lines(as.numeric(final_power$curr), as.numeric(final_power$Sub_metering_3), type = "l", ylab = "Energy sub metering", xlab = " ", main = " ", xaxt = "n", col="blue")
axis(side=1,at= c(unclass(as.POSIXct("2007-02-01 0:00:00")),unclass(as.POSIXct("2007-02-02 0:00:00")),unclass(as.POSIXct("2007-02-03 0:00:00"))), labels = c("Thu", "Fri", "Sat"))
legend("topright",col=c("black", "red", "blue"), lty=c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
plot(as.numeric(final_power$curr), as.numeric(final_power$Global_reactive_power), type = "l", ylab = "Global_reactive_power", xlab = "datetime", main = " ", xaxt = "n")
axis(side=1,at= c(unclass(as.POSIXct("2007-02-01 0:00:00")),unclass(as.POSIXct("2007-02-02 0:00:00")),unclass(as.POSIXct("2007-02-03 0:00:00"))), labels = c("Thu", "Fri", "Sat"))
dev.off()