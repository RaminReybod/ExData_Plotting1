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
names(z)
dt = paste(z$Date, z$Time)
timestamp = as.POSIXct(dt, "%Y-%m-%d %H:%M:%S",tz="")
plot(
  timestamp,
  z$Sub_metering_1,
  type = "l",
  ylab = "Energy sub metering",
  xlab = ""
)
lines(timestamp,z$Sub_metering_2,col="red")
lines(timestamp,z$Sub_metering_3,col="blue")
legend("topright",
       lty=1,
       cex=0.65,
       adj=c(0,0),
       col=c("red","blue","green"),
       xjust=0,
       legend=c(
         "Sub_metering_1",
         "Sub_metering_2",
         "Sub_metering_3")
       )
?png
dev.copy(png, file = "plot3.png",width = 550, height = 480,type="windows") 
dev.off()
