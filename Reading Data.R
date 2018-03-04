# Loading data  UC Irvine Machine Learning Repository
# Exploratory Data Analysis
# Module 4 by Wenzel Pestaño

setwd("E:\\R files\\Module 4")

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