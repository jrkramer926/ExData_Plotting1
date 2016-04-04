directory <- "\\Users\\kcaj2\\Desktop\\Coursera\\Exploratory Data Analysis\\Assignment 1"
setwd(directory)

#read.csv2 uses ";" as a seperator
rawdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")


data <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")
data$datetime <- with(data, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

png(filename = "plot4.png", width = 480, height = 480)

#below sets how many graphs we will show in our window
par(mfrow = c(2,2))

#first graph
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
#second graph
with(data, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
#third graph
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub meeting"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
with(data,
     legend(x ="topright", 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col = c("black", "red", "blue"),
            lwd = 1,
            bty = "n"))
#fourth graph
with(data, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off
