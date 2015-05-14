plot2 <- function() {
### Read and Load Data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep = ";",  stringsAsFactors=F)

### Change Date Format 
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

### Subset Data
subsetdata <- dataset[dataset$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"),]

## Convert dates into POSIXct format
dt <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$DT <- as.POSIXct(dt)

#Plot 2
globalactivepower <- as.numeric(subsetdata$Global_active_power)
plot(subsetdata$DT, globalactivepower, xlab = "", ylab = "Global Active Power (kilowatts)", main ="", type ="l")

png(file="plot2.png", width=480, height=480)

dev.off()

	
	
}

plot2()
