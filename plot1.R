library(plyr)
setwd("E:\\Users\\Andrea\\Downloads\\Data\\Exploratory Data Analysis")
dati <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   na.strings = "?"
                   stringsAsFactors=FALSE, 
                   dec=".")
subset <-dati[dati$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()