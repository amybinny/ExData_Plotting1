png(filename = "plot1.png", width = 480, height = 480)
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power_1_2_feb <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
hist(as.numeric(power_1_2_feb$Global_active_power), col = "red", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()