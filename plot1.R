
data <- read.table('household_power_consumption.txt', header=T, sep=';', 
                   stringsAsFactors=F)
powerdata <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
powerdata$Date <- as.Date(powerdata$Date)
powerdata$Time <- strptime(powerdata$Time, format="%H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
# str(powerdata)
# head(powerdata)

# Plot 1
png(filename="plot1.png",width=480,height=480)
with(powerdata, hist(Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power"))
dev.off()
