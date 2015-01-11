temp <- tempfile()
##Download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
##Unzip file
file<-unzip(temp)
##Print unzip to see files and extract the needed ones
file
unlink(temp)
raw_data <- read.table(file, header = TRUE, sep = ";", na.strings = "?")
as.Date(raw_data$Date, format = "%d/%m/%Y")
strptime(raw_data$Time, format = "%H:%M:%S")
datasub1 <- subset(raw_data, Date == "1/2/2007" | Date == "2/2/2007")
datasub1$datetime <- as.POSIXct(paste(datasub1$Date, datasub1$Time), format="%d/%m/%Y %H:%M:%S")

#Plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(datasub1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
