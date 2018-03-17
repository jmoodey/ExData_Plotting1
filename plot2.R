library(sqldf) 

file_hpc <- file("household_power_consumption.txt")
attr(file_hpc, "file.format") <- list(sep = ";", header = TRUE)

# Select only the required data
hpc <- sqldf("select * from file_hpc where Date = '1/2/2007' or Date = '2/2/2007'") 

hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# Create plot
plot(hpc$datetime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
# Copy the plot to a PNG file
dev.copy(png,file="plot2.png", width = 480, height = 480)

# Close off the file device
dev.off()


