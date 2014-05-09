data <- read.table('household_power_consumption.txt', header=T, sep=';', 
                   stringsAsFactors=F)
powerdata <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
powerdata$time <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Voltage <- as.numeric(powerdata$Voltage)
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)
#str(powerdata)

png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

with(powerdata, {
  plot(time, Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
  lines(time, Global_active_power)  
})

with(powerdata, {
  plot(time, Voltage, type="n", ylab="Voltage", xlab="datetime")
  lines(time, Voltage)
})

with(powerdata, {
  plot(time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  lines(time, Sub_metering_1)
  lines(time, Sub_metering_2, col="red")
  lines(time, Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex=0.8)
})

with(powerdata, {
  plot(time, Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
  lines(time, Global_reactive_power)  
})

dev.off()
