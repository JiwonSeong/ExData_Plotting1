#Reading and extracting data
initial_data <- read.csv("household_power_consumption.txt", sep = ";")
extracted_data <- subset(initial_data, Date == "1/2/2007" |  Date == "2/2/2007")

#Changing dates and times values to "POSIXlt" "POSIXt" 
dates <- extracted_data$Date
times <- extracted_data$Time
y <- as.factor(paste(dates, times))
t <- strptime(y, format = "%d/%m/%Y %H:%M:%S")

#Plotting
with(extracted_data, plot(t, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)",  xlab = ""))

#Saving to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off