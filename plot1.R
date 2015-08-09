url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"temp", mode="wb")
unzip("temp", "household_power_consumption.txt")
x = read.csv(
  "household_power_consumption.txt",
  na.strings = "?",
  stringsAsFactors = FALSE,
  sep=";")
x$Date = as.Date(x$Date,"%d/%m/%Y")
x$Time = format(strptime(x$Time,"%H:%M:%S"),"%H:%M:%S")
z = with(x,subset(x,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")))
with(z,
     hist(Global_active_power,
          xlab = "Global Active Power (kilowatts)",
          col="red",
          main = "Global Active Power"
          )
     )
dev.copy(png, file = "plot1.png") 
dev.off()
