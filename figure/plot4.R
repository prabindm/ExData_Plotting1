library(data.table)
#reads data, adds NA to ? space
house_power <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#extracts 1st and 2nd february 2007
two_days <- house_power[house_power$Date %in% c( "1/2/2007", "2/2/2007")]

# convert date into date class
date <- as.Date(two_days$Date, format = "%d/%m/%Y")
date_time <- paste(date, two_days$Time, sep = " ")
datetime <- strptime(date_time, format = "%Y-%m-%d %H:%M:%S")
date_time_new <- cbind(datetime, two_days)
date_time3 <- date_time_new[complete.cases(date_time_new)]

#plot4
par(mfrow = c(2, 2))
with(date_time3, {
        plot(datetime, Global_active_power, type ="l", ylab = "Global Active Power", xlab = "")
        plot(datetime, Voltage, type ="l")
        plot(date_time3$datetime,date_time3$Sub_metering_1, type= "n", ylab = "Energy sub metering", xlab = "")
        lines(date_time3$datetime, date_time3$Sub_metering_1)
        lines(date_time3$datetime, date_time3$Sub_metering_2, col = "red")
        lines(date_time3$datetime, date_time3$Sub_metering_3, col = "blue")
        legend("topright", col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")
        plot(datetime, Global_reactive_power, type = "l" ,ylim= c(0.0, 0.5))
})
