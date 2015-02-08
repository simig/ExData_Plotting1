# Read the data
pow <- read.csv("household_power_consumption.txt", na.strings="?", header=TRUE, sep=";", colClasses=c(rep("character", 2), rep("numeric", 7)))

# Add a DateTime column with type POSIXct.
pow$DateTime <- as.POSIXct(paste(pow$Date, pow$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# Filter to only the days we want to plot.
begin <- as.POSIXct(strptime("02/01/2007", format("%m/%d/%Y")))
end <- as.POSIXct(strptime("02/03/2007", format("%m/%d/%Y")))
fitered <- pow[pow$DateTime >= begin & pow$DateTime <= end,]

# Plot to a png file
png("plot2.png")
plot(filtered$DateTime, filtered$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()