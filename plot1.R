## includeing packages
library(dplyr)
library(lubridate)

#read data and parse dates as Dates according to theri format
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#transform data to tbl_df to manipulate them elgantly
data <- data %>% tbl_df()

#get the appropriate data elegantly
fd <- data %>% filter(year(Date)==2007) %>% filter(month(Date)==2) %>% filter(day(Date)==2 | day(Date)==1)

#starting the appropriate device to have the plot 
png("plot1.png", width=480, height=480, bg="white")
hist(fd$Global_active_power, main = "Global Active Power", xlab ="Global Active Power (kilowatts)", ylab="Frequency" ,col=c("red"))
dev.off()