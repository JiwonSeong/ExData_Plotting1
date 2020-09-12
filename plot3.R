#Reading and extracting data
initial_data <- read.csv("household_power_consumption.txt", sep = ";")
extracted_data <- subset(initial_data, Date == "1/2/2007" |  Date == "2/2/2007")

#Changing dates and times values to "POSIXlt" "POSIXt" 
dates <- extracted_data$Date
times <- extracted_data$Time
y <- as.factor(paste(dates, times))
t <- strptime(y, format = "%d/%m/%Y %H:%M:%S")

#Plotting
with(extracted_data, plot(t, Sub_metering_1, type="l", ylab = "Energy sub metering",  xlab = ""))
with(extracted_data, lines(t, Sub_metering_2, col = "red"))
with(extracted_data, lines(t, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Saving to png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off