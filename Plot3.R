directory <- "\\Users\\kcaj2\\Desktop\\Coursera\\Exploratory Data Analysis\\Assignment 1"
setwd(directory)

#read.csv2 uses ";" as a seperator
rawdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")


data <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")
data$datetime <- with(data, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))


png("plot3.png", width = 480, height = 480 )

#creats a line with datetime and sub_metering_1
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub meeting"))

#adds sub_metering_2 to our first plot and colors it red
with(data, lines(datetime, Sub_metering_2, col = "red"))

#adds sub_metering_3 to our first plot and colors it blue
with(data, lines(datetime, Sub_metering_3, col = "blue"))

##adds our legend by specifying labels, colors and line type.
with(data, 
     legend(x ="topright", 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col = c("black", "red", "blue"),
            lwd = 1))

#ends the png() above and saves our image
dev.off()
