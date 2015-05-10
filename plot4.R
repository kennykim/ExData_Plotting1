plot4 <- function() {
	#Read and Load Data
dataset <- read.table("~/Desktop/Data Science Specialization/Exploratory Data Analysis/Project 1/household_power_consumption.txt", Header=TRUE, sep = ";", na.strings = "?")

#Changing Date Format for the two dates
Date1 <- strptime("01/02/2007", format='%d/%m/%Y')
Date2 <- strptime("02/02/2007", format='%d/%m/%Y')

#Subset Data
DataSubset <- subset(dataset, strptime(dataset$Date, format=='%d/%m/%Y') >= Date1 & strptime(dataset$Date, format =='%d/%m/%Y') <= Date2)

#Date format
dataset$DateTime <- strptime(paste(myfile$Date, myfile$Time), format='%d/%m/%Y %H:%M:%S')

#Plot 4
png(file="plot4.png", width=480, height=480, units="px")
par(mfrow = c(2,2), mar = c(4,6,4,0.5))

#1
with(dataset, plot(dataset$DateTime, dataset$Global_active_power/1000, type="1", ylab = "Global Active Power (kilowatts)", xlab="", main""))

#2
with(dataset, plot(dataset$DateTime, dataset$Voltage, ylab= "Voltage", type = "1", ylab="Voltage", xlab= "Datetime", main="")

#3
with(dataset, plot(dataset$DateTime, dataset$Sub_metering_1, xlab= "", ylab= "Energy sub metering", type= "n"))
with(dataset, points(dataset$DateTime, dataset$Sub_metering_1, type ="1", col="black"))
with(dataset, points(dataset$DateTime, dataset$Sub_metering_2, type ="1", col="red")) 
with(dataset, points(dataset$DateTime, dataset$Sub_metering_3, type ="1", col="blue"))
legend("topright", lty= c(1,1), col=c("black", "red", "blue"), box.lwd=0, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
with(dataset, plot(dataset$DateTime, dataset$Global_reactive_power, type"1"))

dev.off()

	
	
}

plot4()