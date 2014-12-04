plot3 <- function() {
  ## plot 3
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
  png(file="plot3.png",width=480,height=480)
  with(data1, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
  with(data1, points(DateTime, Sub_metering_2, ylab = "Energy sub metering", xlab = "", type = "l", col = "red"))
  with(data1, points(DateTime, Sub_metering_3, ylab = "Energy sub metering", xlab = "", type = "l", col = "blue"))
  legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
  
}