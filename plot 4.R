
# Step 1: iniciate the connection to the directory
connection <- "C:/Users/DANTEROUS-/Documents/LEN OLIVEROS/Programa especializado Data Scientist coursera/4. Exploratory Data Analysis"
getwd()
setwd(connection)
library(lubridate)

# Step 2: read the data
epc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
head(epc)

# Step 3: Creating the new time data
epc$finaltime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Step 4: change class of all columns to correct class
epc$Date <- dmy(epc$Date)
epc$Global_active_power <- as.numeric(epc$Global_active_power)
epc$Global_reactive_power <- as.numeric(epc$Global_reactive_power)
epc$Voltage <- as.numeric(epc$Voltage)
epc$Global_intensity <- as.numeric(epc$Global_intensity)
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)

# Step 5: Subsetting the data
epcresume <- subset(epc, Date == "2007-02-01" | Date == "2007-02-02")

# Step 6: creating the plots
png(filename = "plot4.png")

par(mfrow = c(2,2))

with(epcresume, plot(finaltime,Global_active_power, xlab = "Day", ylab = "Global Active Power", type = "l"))
with(epcresume, plot(finaltime,Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))
with(epcresume, plot(finaltime,Sub_metering_1, type = "l", xlab = "Day", ylab = "Energy sub metering" ))
with(epcresume,lines(finaltime,Sub_metering_2, type = "l", col = "red"))
with(epcresume,lines(finaltime,Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red", "blue"), lty = 1, lwd = 2)
with(epcresume, plot(finaltime,Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))
dev.off()
