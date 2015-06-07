
library(data.table)
#reads data, adds NA to ? space
house_power <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

#estimate the size of the files in the directory
format(object.size(house_power), units = "Mb")

#extracts 1st and 2nd february 2007
two_days <- house_power[house_power$Date %in% c( "1/2/2007", "2/2/2007")]

#plot1
Global_p1 <- as.numeric(as.character(two_days$Global_active_power))
hist(Global_p1, xlab = "Global Active Power(kilowats)", col = "RED", main = "Global Active Power")