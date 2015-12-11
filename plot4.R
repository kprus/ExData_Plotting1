#Load required package
library(lubridate)
#Read in household_power_consumption.txt from working directory
powerconsump <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
#Subset to include only records from Feb. 1-2, 2007
powerconsump_2days <- subset(powerconsump, Date==("1/2/2007")|Date==("2/2/2007"))
#Convert Global_active_power, Sub_metering, Global_reactive_power, Voltage variables to numeric
powerconsump_2days$Global_active_power_n <- as.numeric(as.character(powerconsump_2days$Global_active_power))
powerconsump_2days$Sub_metering_1_n <- as.numeric(as.character(powerconsump_2days$Sub_metering_1))
powerconsump_2days$Sub_metering_2_n <- as.numeric(as.character(powerconsump_2days$Sub_metering_2))
powerconsump_2days$Sub_metering_3_n <- as.numeric(as.character(powerconsump_2days$Sub_metering_3))
powerconsump_2days$Global_reactive_power_n <- as.numeric(as.character(powerconsump_2days$Global_reactive_power))
powerconsump_2days$Voltage_n <- as.numeric(as.character(powerconsump_2days$Voltage))
#Create DateTime variable
powerconsump_2days$DateTime <- dmy_hms(paste(powerconsump_2days$Date, powerconsump_2days$Time, sep=" "))
#Create plot 4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#Top left plot: Global_active_power vs. DateTime
with(powerconsump_2days, plot(DateTime, Global_active_power_n, type="n", ylab="Global Active Power", xlab=""))
with(powerconsump_2days, lines(DateTime, Global_active_power_n))
#Top right plot: Voltage vs. DateTime
with(powerconsump_2days, plot(DateTime, Voltage_n, type="n", ylab="Voltage", xlab="datetime"))
with(powerconsump_2days, lines(DateTime, Voltage_n))
#Bottom left plot: Energy sub metering vs. DateTime
with(powerconsump_2days, plot(DateTime, Sub_metering_1_n, type="n", ylab="Energy sub metering", xlab=""))
with(powerconsump_2days, lines(DateTime, Sub_metering_1_n, col="black"))
with(powerconsump_2days, lines(DateTime, Sub_metering_2_n, col="red"))
with(powerconsump_2days, lines(DateTime, Sub_metering_3_n, col="blue"))
legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Bottom right plot: Global_reactive_power vs. DateTime
with(powerconsump_2days, plot(DateTime, Global_reactive_power_n, type="n", ylab="Global_reactive_power", xlab="datetime"))
with(powerconsump_2days, lines(DateTime, Global_reactive_power_n))
dev.off()