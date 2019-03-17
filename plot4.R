## read full dataset from local directory


filePath <- "household_power_consumption.txt"
power_usage <- read.table(filePath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_power_usage <- power_usage[power_usage$Date %in% c("1/2/2007","2/2/2007") ,]

dt <- strptime(paste(sub_power_usage$Date, sub_power_usage$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(sub_power_usage$Global_active_power)
globalReactivePower <- as.numeric(sub_power_usage$Global_reactive_power)
voltage <- as.numeric(sub_power_usage$Voltage)
subMetering1 <- as.numeric(sub_power_usage$Sub_metering_1)
subMetering2 <- as.numeric(sub_power_usage$Sub_metering_2)
subMetering3 <- as.numeric(sub_power_usage$Sub_metering_3)

## Call the basic plot function

png("plot4.png", width=504, height=504)

par(mfrow = c(2, 2)) 
plot(dt, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dt, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dt, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dt, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


