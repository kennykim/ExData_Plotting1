plot1 <- function() {
	#Read and Load Data
dataset <- read.table("~/Desktop/Data Science Specialization/Exploratory Data Analysis/Project 1/household_power_consumption.txt", Header=TRUE, sep = ";", na.strings = "?")

#Changing Date Format for the two dates
Date1 <- strptime("01/02/2007", format='%d/%m/%Y')
Date2 <- strptime("02/02/2007", format='%d/%m/%Y')

#Subset Data
DataSubset <- subset(dataset, strptime(dataset$Date, format=='%d/%m/%Y') >= Date1 & strptime(dataset$Date, format =='%d/%m/%Y') <= Date2)

#Plot
png(file="plot1.png", width=480, height=480, units="px")
hist(dataset$Global_active_power, xlab = "Globall Active Power (kilowatts)", col = "red", freq= TRUE, main= Global Active Power)

dev.off()


}

plot1()