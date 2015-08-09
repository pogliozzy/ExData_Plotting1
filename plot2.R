#set path to data file
setwd("E:\\Users\\Andrea\\Downloads\\Data\\Exploratory Data Analysis")
#read all row from "household_power_consumption.txt"
all_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", as.is=TRUE, dec=".")
#subset data from 2007-02-01 and 2007-02-02
subset <-all_data[all_data$Date %in% c("1/2/2007","2/2/2007") ,]
#get datetime
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#get Global_active_power
global_active_power <- as.numeric(subset$Global_active_power)
#prepare image plot
png("plot2.png", width=480, height=480)
#draw chart
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#close device
dev.off()
