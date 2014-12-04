plot1 <- function() {
  ## plot 1
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
  
  ## create histogram
  png(file="plot1.png",width=480,height=480)
  hist(data1$Global_active_power, col = "red", main = "Global active power", xlab = "Global Active Power (kilowatts)")
  dev.off()
  
}