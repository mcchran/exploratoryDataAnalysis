#removing old symbols to avoid conflicts
rm(list=ls())
## includeing packages
library(lubridate)
#read data and parse dates as Dates according to theri format
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date <- paste(data$Date, data$Time, sep=" ")
data$Date <- strptime(data$Date,"%d/%m/%Y %H:%M:%S")
#removing meaningless variables
data <- select(data, -Time)
#get the appropriate data elegantly
#fd <- data %>% filter(year(Date)==2007) %>% filter(month(Date)==2) %>% filter(day(Date)==2 | day(Date)==1)
# however dplyr does not corporate well with
fd <- data[year(data$Date)==2007 & month(data$Date)==2 & (day(data$Date)==1 | day(data$Date)==2), ]

#starting the appropriate device to have the plot 
png("plot4.png", width=480, height=480, bg="white")
par(mfrow=c(2,2))
#plot1
plot(x=fd$Date, y=fd$Global_active_power, xlab="", ylab="Global Active Power", type="l")
#plot2
plot(x=fd$Date, y=fd$Voltage, xlab="datetime", ylab="Voltage", type="l")
#plot 3
plot(x=fd$Date, y=fd$Sub_metering_1, xlab="", ylab="Energy sub Metering", type="l",col="grey")
lines(x=fd$Date, y=fd$Sub_metering_2,col="red")
lines(x=fd$Date, y=fd$Sub_metering_3,col="blue")
legend("topright", lwd = 2, bty="n", col = c("grey", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot 4
plot(x=fd$Date, y=fd$Global_reactive_power, xlab="datetime", ylab="Global Reactive Power", type="l")
dev.off()