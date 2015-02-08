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
png("plot2.png", width=480, height=480, bg="white")
plot(x=fd$Date, y=fd$Global_active_power, xlab="time", ylab="Global Active Power (Killowats)", type="l")
dev.off()