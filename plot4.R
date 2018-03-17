library(sqldf) 

file_hpc <- file("household_power_consumption.txt")
attr(file_hpc, "file.format") <- list(sep = ";", header = TRUE)

# Select only the required data
hpc <- sqldf("select * from file_hpc where Date = '1/2/2007' or Date = '2/2/2007'") 

hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

par(oma=c(2,3,2,2),mar=c(4,6,2,2),mfrow=c(2,2))

# Create plot 1
plot(hpc$datetime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")

# Create plot 2
plot(hpc$datetime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Create plot 3
plot(hpc$datetime, hpc$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(hpc$datetime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$datetime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "), lty = c(1, 1, 1), col = c("black","red","blue"), bty="n",cex = 0.75, inset = .01)


# Create plot 4
plot(hpc$datetime, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Copy the plot to a PNG file
dev.copy(png,file="plot4.png", width = 480, height = 480)

# Close off the file device
dev.off()

