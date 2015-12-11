#Load required package
library(lubridate)
#Read in household_power_consumption.txt from working directory
powerconsump <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
#Subset to include only records from Feb. 1-2, 2007
powerconsump_2days <- subset(powerconsump, Date==("1/2/2007")|Date==("2/2/2007"))
#Convert Global_active_power to a numeric variable
powerconsump_2days$Global_active_power_n <- as.numeric(as.character(powerconsump_2days$Global_active_power))
#Create DateTime variable
powerconsump_2days$DateTime <- dmy_hms(paste(powerconsump_2days$Date, powerconsump_2days$Time, sep=" "))
#Create plot 2: Global_active_power vs. DateTime
png(filename="plot2.png", width=480, height=480)
with(powerconsump_2days, plot(DateTime, Global_active_power_n, type="n", ylab="Global Active Power (kilowatts)", xlab=""))
with(powerconsump_2days, lines(DateTime, Global_active_power_n))
dev.off()