plot4 <- function() {
  ## plot 4
  ## download and read data
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  ## read fixing "?" as NA
  data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep= ";", na.strings = "?", stringsAsFactors = FALSE)
  unlink(temp)
  ## filter data by date: 2007-02-01 and 2007-02-02
  data1 <- data[data$Date %in% c('1/2/2007', '2/2/2007'), ]
  ## create new column with datetime value
  data1$DateTime <- strptime(paste(data1$Date, data1$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  ## create plot
  png(file="plot4.png",width=480,height=480)
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  with(data1, {
    plot(DateTime, Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")
    plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
    plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
    points(DateTime, Sub_metering_2, ylab = "Energy sub metering", xlab = "", type = "l", col = "red")
    points(DateTime, Sub_metering_3, ylab = "Energy sub metering", xlab = "", type = "l", col = "blue")
    legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
    plot(DateTime, Global_reactive_power, xlab = "datetime", type = "l")
  })
  dev.off()
  
}