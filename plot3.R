#Load required package
library(lubridate)
#Read in household_power_consumption.txt from working directory
powerconsump <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
#Subset to include only records from Feb. 1-2, 2007
powerconsump_2days <- subset(powerconsump, Date==("1/2/2007")|Date==("2/2/2007"))
#Convert Sub_metering variables to numeric
powerconsump_2days$Sub_metering_1_n <- as.numeric(as.character(powerconsump_2days$Sub_metering_1))
powerconsump_2days$Sub_metering_2_n <- as.numeric(as.character(powerconsump_2days$Sub_metering_2))
powerconsump_2days$Sub_metering_3_n <- as.numeric(as.character(powerconsump_2days$Sub_metering_3))
#Create DateTime variable
powerconsump_2days$DateTime <- dmy_hms(paste(powerconsump_2days$Date, powerconsump_2days$Time, sep=" "))
#Create plot 3: Energy sub metering vs. DateTime
png(filename="plot3.png", width=480, height=480)
with(powerconsump_2days, plot(DateTime, Sub_metering_1_n, type="n", ylab="Energy sub metering", xlab=""))
with(powerconsump_2days, lines(DateTime, Sub_metering_1_n, col="black"))
with(powerconsump_2days, lines(DateTime, Sub_metering_2_n, col="red"))
with(powerconsump_2days, lines(DateTime, Sub_metering_3_n, col="blue"))
legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()