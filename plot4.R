prog4 <- function(){
  
  dataFile <- "household_power_consumption.txt"
  data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
  Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
  Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
  globalActivePower <- as.numeric(subSetData$Global_active_power)
  globalreactivePower <- as.numeric(subSetData$Global_reactive_power)
  Voltage <- as.numeric(subSetData$Voltage)
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2,2))
  plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  with(subSetData, {
    plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    plot(datetime, Voltage, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    
    hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    plot(datetime, globalreactivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    
    mtext("Ozone and Weather in New York City", outer = TRUE)
  })
  
  dev.off()
  
  
  
}