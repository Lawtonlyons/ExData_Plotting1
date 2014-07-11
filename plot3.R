temp <- tempfile()
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
unlink(temp)
plotdata <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
plotdata$DateTime <- strptime(paste(plotdata$Date, plotdata$Time), "%d/%m/%Y %H:%M:%S")
plot(plotdata$DateTime, plotdata[,7], type = "l", xlab = " ", ylab = "Energy sub metering")
lines(plotdata[,10], plotdata[,8], col = "Red")
lines(plotdata[,10], plotdata[,9], col = "Blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1)
dev.copy(png,file="plot3.png")
dev.off()
