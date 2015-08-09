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
dt = paste(z$Date, z$Time)
timestamp = as.POSIXct(dt, "%Y-%m-%d %H:%M:%S",tz="")
plot(
  timestamp,
  z$Global_active_power,
  type = "l",
  xlab = "Global Active Power (kilowatts)",
)
