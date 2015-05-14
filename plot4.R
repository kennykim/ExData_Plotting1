plot4 <- function() {
### Read and Load Data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep = ";",  stringsAsFactors=F)

### Change Date Format 
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

### Subset Data
subsetdata <- dataset[dataset$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"),]

## Convert dates into POSIXct format
dt <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$DT <- as.POSIXct(dt)

#Plot 4
par(mfrow = c(2,2), mar = c(4,6,4,0.5))

#1
gap <- as.numeric(subsetdata$Global_active_power)
with(subsetdata, plot(subsetdata$DT, subsetdata$gap, type="l", ylab = "Global Active Power (kilowatts)", xlab="", main""))

#2
volt <- as.numeric(subsetdata$Voltage)
with(subsetdata, plot(subsetdata$DT, volt, ylab= "Voltage", type = "l", ylab="Voltage", xlab= "datetime", main="")

#3
with(subsetdata, plot(subsetdata$DT, subsetdata$Sub_metering_1, xlab= "", ylab= "Energy sub metering", type= "l"))
with(subsetdata, points(subsetdata$DT, subsetdata$Sub_metering_1, type ="l", col="black"))
with(subsetdata, points(subsetdata$DT, subsetdata$Sub_metering_2, type ="l", col="red")) 
with(subsetdata, points(subsetdata$DT, subsetdata$Sub_metering_3, type ="l", col="blue"))
legend("topright", lty= c(1,1), col=c("black", "red", "blue"), box.lwd=0, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4
grp <- as.numeric(subsetdata$Global_reactive_power)
with(subsetdata, plot(subsetdata$DT, grp, type="l", ylab = "Global Active Power (kilowatts)", xlab="", main""))


png(file="plot4.png", width=480, height=480, units="px")

dev.off()

	
	
}

plot4()

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subdata)
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subdata$Global_active_power)
globalReactivePower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()