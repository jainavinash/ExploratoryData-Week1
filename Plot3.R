Plot3 <- function()
{
  data <- read.table("household_power_consumption.txt", header = T, sep=";") 
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  data_new <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  datetime <- paste(as.Date(data_new$Date), data_new$Time)
  data_new$Datetime <- as.POSIXct(datetime)
  
  globalActivePower <- as.numeric(data_new$Global_active_power)

  subMetering1 <- as.numeric(data_new$Sub_metering_1)
  subMetering2 <- as.numeric(data_new$Sub_metering_2)
  subMetering3 <- as.numeric(data_new$Sub_metering_3)
  

  png("plot3.png", width=480, height=480)
  
  plot(data_new$Datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")  
  lines(data_new$Datetime, subMetering2, type="l", col="red")
  lines(data_new$Datetime, subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
  
  dev.off()
  
  
}