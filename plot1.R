df <- read.csv("household_power_consumption.txt",na.strings = "?",sep = ";")
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]

png(filename='plot1.png',width=480,height=480,units='px')
hist(df$Global_active_power, main="Global active power", xlab='Global Active Power (kilowatts)',col='red')
dev.off()