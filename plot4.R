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
#get Global_reactive_power
global_reactive_power <- as.numeric(subset$Global_reactive_power)
#get Voltage
voltage <- as.numeric(subset$Voltage)
#prepare image plot
png("plot4.png", width=480, height=480)
#set param mfrow to display charts in columns
par(mfrow = c(2, 2)) 
#draw global_active_power
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#draw Voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#draw all Sub_meterings and add legend
plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#draw global_reactive_power
plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#close device
dev.off()
