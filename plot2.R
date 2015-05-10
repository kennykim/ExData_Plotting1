plot2 <- function() {
	#Read and Load Data
dataset <- read.table("~/Desktop/Data Science Specialization/Exploratory Data Analysis/Project 1/household_power_consumption.txt", Header=TRUE, sep = ";", na.strings = "?")

#Changing Date Format for the two dates
Date1 <- strptime("01/02/2007", format='%d/%m/%Y')
Date2 <- strptime("02/02/2007", format='%d/%m/%Y')

#Subset Data
DataSubset <- subset(dataset, strptime(dataset$Date, format=='%d/%m/%Y') >= Date1 & strptime(dataset$Date, format =='%d/%m/%Y') <= Date2)

#Date format
dataset$DateTime <- strptime(paste(myfile$Date, myfile$Time), format='%d/%m/%Y %H:%M:%S')

#Plot 2
png(file="plot2.png", width=480, height=480, units="px")
with(dataset, plot(dataset$DateTime, dataset$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main ="", type = "1", asp= "square"))

dev.off()

	
	
}

plot2()