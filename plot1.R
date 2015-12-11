#Read in household_power_consumption.txt from working directory
powerconsump <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
#Subset to include only records from Feb. 1-2, 2007
powerconsump_2days <- subset(powerconsump, Date==("1/2/2007")|Date==("2/2/2007"))
#Convert Global_active_power to a numeric variable
powerconsump_2days$Global_active_power_n <- as.numeric(as.character(powerconsump_2days$Global_active_power))
#Create plot 1: histogram of Global_active_power
png(filename="plot1.png", width=480, height=480)
hist(powerconsump_2days$Global_active_power_n, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()