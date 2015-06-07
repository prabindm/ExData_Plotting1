#require data.table package to fread
require(data.table)

#reads data, adds NA to ? space
house_power <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#extracts 1st and 2nd february 2007
two_days <- house_power[house_power$Date %in% c( "1/2/2007", "2/2/2007")]

# convert date into date class
date <- as.Date(two_days$Date, format = "%d/%m/%Y")
date_time <- paste(date, two_days$Time, sep = " ")
date_time2 <- strptime(date_time, format = "%Y-%m-%d %H:%M:%S")

#plot2
plot(date_time2, two_days$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power(kilowats)")
