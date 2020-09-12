#Reading and extracting data
initial_data <- read.csv("household_power_consumption.txt", sep = ";")
extracted_data <- subset(initial_data, Date == "1/2/2007" |  Date == "2/2/2007")

#Changing dates and times values to "POSIXlt" "POSIXt" 
dates <- extracted_data$Date
times <- extracted_data$Time
y <- as.factor(paste(dates, times))
t <- strptime(y, format = "%d/%m/%Y %H:%M:%S")

#Plotting
par(mfrow = c(2, 2))
with(extracted_data, {
    plot(t, Global_active_power, type="l", ylab = "Global Active Power",  xlab = "")
    plot(t, Voltage, type="l", ylab = "Voltage",  xlab = "datetime")
    with(extracted_data, plot(t, Sub_metering_1, type="l", ylab = "Energy sub metering",  xlab = ""))
    with(extracted_data, lines(t, Sub_metering_2, col = "red"))
    with(extracted_data, lines(t, Sub_metering_3, col = "blue"))
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(t, Global_reactive_power, type="l", ylab = "Global_reactive_power",  xlab = "datetime")
})

#Saving to png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off