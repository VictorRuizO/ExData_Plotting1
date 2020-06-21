df <- read.csv("household_power_consumption.txt",na.strings = "?",sep = ";")
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
df$Date <- as.Date(df$Date,"%d/%m/%Y")
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)
png(filename='plot4.png',width=480,height=480,units='px')

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(df$Datetime,df$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')

plot(df$Datetime,df$Voltage,type="l",ylab="Voltage (volt)", xlab="datetime")

plot(df$Datetime,df$Sub_metering_1,ylab='Global Active Power (kilowatts)', xlab='', type='l')
lines(df$Datetime,df$Sub_metering_2, col="Red")
lines(df$Datetime,df$Sub_metering_3, col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(df$Datetime,df$Global_reactive_power,type="l",ylab="Global Rective Power (kilowatts)",xlab="datetime")
dev.off()
