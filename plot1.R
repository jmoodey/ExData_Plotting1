library(sqldf) 

file_hpc <- file("household_power_consumption.txt")
attr(file_hpc, "file.format") <- list(sep = ";", header = TRUE)

# Select only the required data
hpc <- sqldf("select * from file_hpc where Date = '1/2/2007' or Date = '2/2/2007'") 

# Create plot
hist(hpc$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency")

# Copy the plot to a PNG file
dev.copy(png,file="plot1.png", width = 480, height = 480)


# Close off the png device
dev.off()


