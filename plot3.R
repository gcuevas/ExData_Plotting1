## Downloading the file from scratch

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)

#Unzip file
file<-unzip(temp)
unlink(temp)
# Reading data
raw_data <- read.table(file, header = TRUE, sep = ";", na.strings = "?")
as.Date(raw_data$Date, format = "%d/%m/%Y")
strptime(raw_data$Time, format = "%H:%M:%S")
# Subsetting data
datasub1 <- subset(raw_data, Date == "1/2/2007" | Date == "2/2/2007")
# Creating datetime variable
datasub1$datetime <- as.POSIXct(paste(datasub1$Date, datasub1$Time), format="%d/%m/%Y %H:%M:%S")


##Start Plotting
#Plot 3
png(file = "plot3.png", width = 480, height = 480)
plot(datasub1$datetime, datasub1$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(datasub1$datetime, datasub1$Sub_metering_1, col = "black")
lines(datasub1$datetime, datasub1$Sub_metering_2, col = "red")
lines(datasub1$datetime, datasub1$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()
