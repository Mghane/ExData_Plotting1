## Loading Data
library(data.table)
setwd("C:/Users/Mehdi/Desktop/Desktop/Data Science/Courses/4.Explanatory Data Analysis/week1/Assignment")
## memory required = no. of column * no. of rows * 8 bytes/numeric= 2075259*9*8/2^20=142.496727 MB of memory is required
file <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header = FALSE, na.strings = "?", skip =66637, nrows = 2880)
colnames(file) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
DateTime <- strptime(paste(file$Date, file$Time, sep = " "), format ="%d/%m/%Y %H:%M:%S" )
Data <- cbind(DateTime, file[,3:9])
##################################################################################              
## Frist Plot
source("Week1Assignment.R")
with(data = Data, hist(Global_active_power, col="red", xlab = "Global Active Power(kwatts)", main = "Global Active Power"))
dev.copy(png,"Plot 1.png")  ## copy plot to a png file
dev.off()
##################################################################################              
## Second Plot
source("Week1Assignment.R")
par(pch=" ",lty=1 , lwd=2)
with(Data, plot(DateTime, Global_active_power, xlab="", ylab = "Global Active Power(kwatts)", main = "Global Active Power"))
with(Data, lines(DateTime, Global_active_power))
dev.copy(png,"Plot 2.png")  ## copy plot to a png file
dev.off()
##################################################################################     
## Third Plot
source("Week1Assignment.R")
with(Data, plot(DateTime, Sub_metering_1, xlab="", ylab = "Energy Sub Metering", type = "n"))
with(Data, lines(DateTime, Sub_metering_1))
with(Data, lines(DateTime, Sub_metering_2, col="red"))
with(Data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))
dev.copy(png,"Plot 3.png")  ## copy plot to a png file
dev.off()
##################################################################################  
## Forth Plot
source("Week1Assignment.R")
par(mfrow=c(2,2))
with(Data, plot(DateTime, Global_active_power, xlab="", ylab = "Global Active Power", type = "n"))
with(Data, lines(DateTime, Global_active_power))
with(Data, plot(DateTime, Voltage, ylab = "Voltage", type = "n"))
with(Data, lines(DateTime, Voltage))
with(Data, plot(DateTime, Sub_metering_1, xlab="", ylab = "Energy Sub Metering", type = "n"))
with(Data, lines(DateTime, Sub_metering_1))
with(Data, lines(DateTime, Sub_metering_2, col="red"))
with(Data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))
with(Data, plot(DateTime, Global_reactive_power, ylab = "Global Reactive Power", type = "n"))
with(Data, lines(DateTime, Global_reactive_power))
dev.copy(png,"Plot 4.png")  ## copy plot to a png file
dev.off()
################## END