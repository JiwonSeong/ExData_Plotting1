#Reading and extracting data
initial_data <- read.csv("household_power_consumption.txt", sep = ";")
extracted_data <- subset(initial_data, Date == "1/2/2007" |  Date == "2/2/2007")
g_a_power <- as.numeric(extracted_data$Global_active_power)

#Plotting the data
hist(g_a_power[!is.na(g_a_power)], xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

#Saving to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off