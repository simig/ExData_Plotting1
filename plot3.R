# Read the data
pow <- read.csv("household_power_consumption.txt", na.strings="?", header=TRUE, sep=";", colClasses=c(rep("character", 2), rep("numeric", 7)))

# Add a DateTime column with type POSIXct.
pow$DateTime <- as.POSIXct(paste(pow$Date, pow$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# Filter to only the days we want to plot.
begin <- as.POSIXct(strptime("02/01/2007", format("%m/%d/%Y")))
end <- as.POSIXct(strptime("02/03/2007", format("%m/%d/%Y")))
fitered <- pow[pow$DateTime >= begin & pow$DateTime <= end,]

# Plot to a png file
png("plot3.png")
plot(filtered$DateTime, filtered$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering', col="black")
lines(filtered$DateTime, filtered$Sub_metering_2, col='red')
lines(filtered$DateTime, filtered$Sub_metering_3, col='blue')
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
dev.off()