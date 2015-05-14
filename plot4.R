plot4 <- function() {
### Read and Load Data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", check.names=F, 									stringsAsFactors=F, comment.char="", quote='\"')

### Change Date Format 
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

### Subset Data
subsetdata <- dataset[dataset$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"),]

## Convert dates into POSIXct format
dt <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$DT <- as.POSIXct(dt)

gap <- as.numeric(subsetdata$Global_active_power)
volt <- as.numeric(subsetdata$Voltage)
grp <- as.numeric(subsetdata$Global_reactive_power)

#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(subsetdata, {
  plot(DT, gap, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(DT, volt, type="l", ylab="Voltage", xlab="datetime")
  plot(DT,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(DT,Sub_metering_2,col='Red')
  lines(DT,Sub_metering_3, col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=c(1,1), box.lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DT, grp, type="l", ylab="Global_reactive_power",xlab="datetime")})


png(file="plot4.png", width=480, height=480, units="px")

dev.off()

		
}

plot4()

