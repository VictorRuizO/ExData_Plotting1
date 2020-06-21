df <- read.csv("household_power_consumption.txt",na.strings = "?",sep = ";")
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
df$Date <- as.Date(df$Date,"%d/%m/%Y")
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)
df$Global_active_power <- as.numeric(df$Global_active_power)
png(filename='plot2.png',width=480,height=480,units='px')
plot(df$Datetime,df$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()