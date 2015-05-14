plot1 <- function() {

### Read and Load Data
dataset <- read.table("household_power_consumption.txt", header=TRUE, sep = ";",  stringsAsFactors=F)

### Changing Date Format 
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

### Subset Data
subsetdata <- dataset[dataset$Date %in% as.Date(c('01/02/2007', '02/02/2007'), "%d/%m/%Y"), ]

### Plot 1 

globalactivepower <- as.numeric(subsetdata$Global_active_power)
hist(globalactivepower, xlab = "Global Active Power (kilowatts)", col = "red", freq= TRUE, main= "Global Active Power")

png(file="plot1.png", width=480, height=480, units="px")

dev.off()


}

plot1()