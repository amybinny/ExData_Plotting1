png(filename = "plot4.png", width = 480, height = 480)
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power_1_2_feb <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power_1_2_feb$period <- paste(power_1_2_feb$Date, power_1_2_feb$Time)
curr <- strptime(power_1_2_feb$period, format = "%d/%m/%Y %H:%M:%S")
final_power<-cbind(power_1_2_feb, curr)
par(mfrow=c(2,2))
#1
plot(as.numeric(final_power$curr), as.numeric(final_power$Global_active_power), type = "l", ylab = "Global Active Power", xlab = " ", main = " ", xaxt = "n", yaxt = "n")
axis(side=1,at= c(unclass(as.POSIXct("2007-02-01 0:00:00")),unclass(as.POSIXct("2007-02-02 0:00:00")),unclass(as.POSIXct("2007-02-03 0:00:00"))), labels = c("Thu", "Fri", "Sat"))
axis(side=2,at= c(0,1000,2000,3000), labels = c(0,2,4,6))

#2
plot(as.numeric(final_power$curr), as.numeric(final_power$Voltage), type = "l", ylab = "Voltage", xlab = "datetime", main = " ", xaxt = "n", yaxt = "n")
axis(side=1,at= c(unclass(as.POSIXct("2007-02-01 0:00:00")),unclass(as.POSIXct("2007-02-02 0:00:00")),unclass(as.POSIXct("2007-02-03 0:00:00"))), labels = c("Thu", "Fri", "Sat"))
axis(side=2, at=c(800, 1200, 1600, 2000), labels = c(234,238,242,246))

#3
par(col="red")
plot(as.numeric(final_power$curr), as.numeric(final_power$Sub_metering_2), type = "l", ylab = "Energy sub metering", xlab = " ", main = " ", xaxt = "n", ylim = c(2,35), yaxt="n")
par(col="blue", col.axis="black")
par(new=TRUE)
plot(as.numeric(final_power$curr), as.numeric(final_power$Sub_metering_3), type = "l", ylab = "Energy sub metering", xlab = " ", main = " ", xaxt = "n", ylim = c(0,35), yaxt = "n")
par(new=TRUE)
par(col="black")
plot(as.numeric(final_power$curr), as.numeric(final_power$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = " ", main = " ", xaxt = "n", ylim = c(2,35), yaxt = "n")
axis(side=1,at= c(unclass(as.POSIXct("2007-02-01 0:00:00")),unclass(as.POSIXct("2007-02-02 0:00:00")),unclass(as.POSIXct("2007-02-03 0:00:00"))), labels = c("Thu", "Fri", "Sat"))
axis(side=2, at = c(0,10,20,30), labels = c(0,10,20,30))
legend("topright",col=c("black", "red", "blue"), lty=c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
plot(as.numeric(final_power$curr), as.numeric(final_power$Global_reactive_power), type = "l", ylab = "Global_reactive_power", xlab = "datetime", main = " ", xaxt = "n", yaxt="n")
axis(side=1,at= c(unclass(as.POSIXct("2007-02-01 0:00:00")),unclass(as.POSIXct("2007-02-02 0:00:00")),unclass(as.POSIXct("2007-02-03 0:00:00"))), labels = c("Thu", "Fri", "Sat"))
#axis(side=2, at=c(2.0,47.6,93.2,138.8,184.4,230), labels = c(0.0,0.1,0.2,0.3,0.4,0.5))
axis(side=2, at=c(quantile(range(as.numeric(final_power$Global_reactive_power)), probs = 0.0),quantile(range(as.numeric(final_power$Global_reactive_power)), probs = .2),quantile(range(as.numeric(final_power$Global_reactive_power)), probs = .4),quantile(range(as.numeric(final_power$Global_reactive_power)), probs = .6),quantile(range(as.numeric(final_power$Global_reactive_power)), probs = .8),quantile(range(as.numeric(final_power$Global_reactive_power)), probs = 1)), labels = c(0.0,0.1,0.2,0.3,0.4,0.5))
dev.off()