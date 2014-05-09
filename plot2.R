data <- read.table('household_power_consumption.txt', header=T, sep=';', 
                   stringsAsFactors=F)
powerdata <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
powerdata$time <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
#str(powerdata)

png(filename="plot2.png",width=480,height=480)
with(powerdata, {
  plot(time, Global_active_power, type="n", ylab="Global Active Power (kilowatts)")
  lines(time, Global_active_power)  
})
dev.off()
