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
#get Sub_metering_1
sub_metering_1 <- as.numeric(subset$Sub_metering_1)
#get Sub_metering_2
sub_metering_2 <- as.numeric(subset$Sub_metering_2)
#get Sub_metering_3
sub_metering_3 <- as.numeric(subset$Sub_metering_3)
#prepare image plot
png("plot3.png", width=480, height=480)
#draw chart sub_metering_1
plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
#add sub_metering_2
lines(datetime, sub_metering_2, type="l", col="red")
#add sub_metering_3
lines(datetime, sub_metering_3, type="l", col="blue")
#add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#close device
dev.off()
