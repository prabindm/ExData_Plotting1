#data.table package required to fread
require(data.table)
#reads data, adds NA to ? space
house_power <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#extracts 1st and 2nd february 2007
two_days <- house_power[house_power$Date %in% c( "1/2/2007", "2/2/2007")]

# convert date into date class
date <- as.Date(two_days$Date, format = "%d/%m/%Y")
date_time <- paste(date, two_days$Time, sep = " ")
date_time2 <- strptime(date_time, format = "%Y-%m-%d %H:%M:%S")
date_time_new <- cbind(date_time2, two_days)
date_time3 <- date_time_new[complete.cases(date_time_new)]

#plot3

with(date_time3, plot(date_time2, Sub_metering_1, , type = "n",, ylab = "Energy sub metering", xlab = ""))
with(date_time3, lines(date_time2, Sub_metering_1))
with(date_time3, lines(date_time2, Sub_metering_2, col = "red"))
with(date_time3, lines(date_time2, Sub_metering_3, col = "blue"))
legend("topright", col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
