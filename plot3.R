plot3 <- function() {
### Read and Load Data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep = ";",  stringsAsFactors=F)

### Change Date Format 
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

### Subset Data
subsetdata <- dataset[dataset$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"),]

## Convert dates into POSIXct format
dt <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$DT <- as.POSIXct(dt)

#Plot 3
with(subsetdata, plot(subsetdata$DT, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main ="", type = "l", asp= "square"))
with(subsetdata, points(subsetdata$DT, Sub_metering_1, type="l", col="black"))
with(subsetdata, points(subsetdata$DT, Sub_metering_2, type="l", col="red" ))
with(subsetdata, points(subsetdata$DT, Sub_metering_3, type="l", col="blue"))

legend("topright", lty = c(1,1), col = c("black", "blue", "red"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd=0, bow.col ="white")

png(file="plot3.png", width=480, height=480, units="px")

dev.off()

	
	
}

plot3()