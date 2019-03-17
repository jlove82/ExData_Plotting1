## read full dataset from local directory

power_usage <- read.table("household_power_consumption.txt", skip=1, sep=';', na.strings="?")

names(power_usage) <- c("Date","Time","Global_active_power","Global_reactive_power","voltage",
"Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

sub_power_usage <- subset(power_usage,power_usage$Date=="1/2/2007" | power_usage$Date=="2/2/2007")

## Create PNG file
png("plot1.png",width=480,height=480)

## Call the basic plot function

hist(as.numeric(as.character(sub_power_usage$Global_active_power)),
main="Global Active Power",
xlab="Global Active Power(kilowatts)",
ylab="Frequency",
col="red"
)

## Main Title
title(main="Global Active Power")

dev.off()





