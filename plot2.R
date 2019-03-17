## read full dataset from local directory

power_usage <- read.table("household_power_consumption.txt", skip=1, sep=';', na.strings="?")

names(power_usage) <- c("Date","Time","Global_active_power","Global_reactive_power","voltage",
"Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

sub_power_usage <- subset(power_usage,power_usage$Date=="1/2/2007" | power_usage$Date=="2/2/2007")

## Create PNG file
png("plot2.png",width=480,height=480)

## Transforming Date and Time 

sub_power_usage$Date<-as.Date(sub_power_usage$Date, format="%D/%M/%Y")
sub_power_usage$Time<-strptime(sub_power_usage$Time, format="%H:%M:%S")
sub_power_usage[1:1440,"Time"]<-format(sub_power_usage[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_power_usage[1441:2880,"Time"]<-format(sub_power_usage[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


## Call the basic plot function

plot(sub_power_usage$Time,as.numeric(as.character(sub_power_usage$Global_active_power)),
type="l",
xlab="",
ylab="Global Active Power (kilowatts)")

## Main Title
title(main="Global Active Power Vs Time")

dev.off()





