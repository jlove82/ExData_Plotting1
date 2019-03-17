## read full dataset from local directory

power_usage <- read.table("household_power_consumption.txt", skip=1, sep=';', na.strings="?")

names(power_usage) <- c("Date","Time","Global_active_power","Global_reactive_power","voltage",
"Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

sub_power_usage <- subset(power_usage,power_usage$Date=="1/2/2007" | power_usage$Date=="2/2/2007")

## Create PNG file
png("plot3.png",width=480,height=480)

## Transforming Date and Time 

dt <-strptime(paste(sub_power_usage$Date, sub_power_usage$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

## Call the basic plot function

plot(dt, as.numeric(sub_power_usage$Sub_metering_1),type="l",xlab="", ylab="Energy Submetering")
lines(dt, as.numeric(sub_power_usage$Sub_metering_2),type="l",col="red")
lines(dt, as.numeric(sub_power_usage$Sub_metering_3),type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))

## Main Title
title(main="Energy sub-metering")

dev.off()





