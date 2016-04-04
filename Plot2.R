directory <- "\\Users\\kcaj2\\Desktop\\Coursera\\Exploratory Data Analysis\\Assignment 1"
setwd(directory)

#CSV data uses ";" as a seperator
rawdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#subsets data for the two dates we will observe
data <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")

#combines Date and Time column, and converts it to datetime format
data$datetime <- with(data, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

#below saves our graph
png("plot2.png", width = 480, height = 480 )
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
