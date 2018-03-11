## Create Plot 3

with(reading, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col="red")
  lines(Sub_metering_3~dateTime,col="blue")
  legend('topright', col=c("black", "red", "blue"),lty=c(1,1,1), lwd= c(1,1,1),  
         cex=0.5, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
## Saving and close device
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
