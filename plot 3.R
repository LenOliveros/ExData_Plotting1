
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
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)
epc$Date <- dmy(epc$Date)
head(epc)

# Step 4: Subsetting the data
epcenergy <- subset(epc, Date == "2007-02-01" | Date == "2007-02-02")

# Step 5: Creating the plot 
png(filename = "plot3.png")
with(epcenergy, plot(finaltime,Sub_metering_1, type = "l", xlab = "Day", ylab = "Energy sub metering" ))
with(epcenergy,lines(finaltime,Sub_metering_2, type = "l", col = "red"))
with(epcenergy,lines(finaltime,Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red", "blue"), lty = 1, lwd = 2)     
dev.off()