Plot1 <- function()
{
  data <- read.table("household_power_consumption.txt", header = T, sep=";") 
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  data_new <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  datetime <- paste(as.Date(data_new$Date), data_new$Time)
  data_new$Datetime <- as.POSIXct(datetime)
  
  globalActivePower <- as.numeric(data_new$Global_active_power)
  png("plot1.png", width=480, height=480)

  hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()

  
}