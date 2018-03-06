# Loading data  UC Irvine Machine Learning Repository
# Exploratory Data Analysis
# Module 4 by Wenzel Pestaño

## Setting the working directory
setwd("E:\\R files\\Module 4")

## Getting table from the dataset and setting separator, NA string and classes of column
reading <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
reading$Date <- as.Date(reading$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
reading <- subset(reading,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
reading <- reading[complete.cases(reading),]

## Combine Date and Time column
dateTime <- paste(reading$Date, reading$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
reading <- reading[ ,!(names(reading) %in% c("Date","Time"))]

## Add DateTime column
reading <- cbind(dateTime, reading)

## Format dateTime Column
reading$dateTime <- as.POSIXct(dateTime)

## Create the Plot 1 (histogram)
hist(reading$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
## Save and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

## Create Plot 2
plot(reading$Global_active_power~reading$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

## Create Plot 3
with(reading, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving and close device
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

## Create Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(reading, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

## Saving and close device
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
