plot3 <- function() {
	#Read and Load Data
dataset <- read.table("~/Desktop/Data Science Specialization/Exploratory Data Analysis/Project 1/household_power_consumption.txt", Header=TRUE, sep = ";", na.strings = "?")

#Changing Date Format for the two dates
Date1 <- strptime("01/02/2007", format='%d/%m/%Y')
Date2 <- strptime("02/02/2007", format='%d/%m/%Y')

#Subset Data
DataSubset <- subset(dataset, strptime(dataset$Date, format=='%d/%m/%Y') >= Date1 & strptime(dataset$Date, format =='%d/%m/%Y') <= Date2)

#Date format
dataset$DateTime <- strptime(paste(myfile$Date, myfile$Time), format='%d/%m/%Y %H:%M:%S')

#Plot 3
png(file="plot3.png", width=480, height=480, units="px")
with(dataset, plot(dataset$DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main ="", type = "n", asp= "square"))
with(dataset, points(dataset$DateTime, Sub_metering_1, type="1", col="black"))
with(dataset, points(dataset$DateTime, Sub_metering_2, type="1", col="red" ))
with(dataset, points(dataset$DateTime, Sub_metering_3, type="1", col="blue"))
legend("topright", lty = c(1,1), col = c("black", "blue", "red"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd=0, bow.col ="white")
dev.off()

	
	
}

plot3()