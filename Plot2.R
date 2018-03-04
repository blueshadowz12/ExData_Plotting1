## Create Plot 2

plot(reading$Global_active_power~reading$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()