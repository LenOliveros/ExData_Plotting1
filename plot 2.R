
# Step 1: iniciate the connection to the directory
connection <- "C:/Users/DANTEROUS-/Documents/LEN OLIVEROS/Programa especializado Data Scientist coursera/4. Exploratory Data Analysis"
getwd()
setwd(connection)
library(lubridate)

# Step 2: read the data
epc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
head(epc)

# Step 3: Creating de new time variable
epc$finaltime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
epc$Global_active_power <- as.numeric(epc$Global_active_power)
epc$Date <- dmy(epc$Date)
head(epc)

# Step 4: Subsetting the data
epcdays <-  subset(epc, Date == "2007-02-01" | Date == "2007-02-02")
head(epcdays)


# Step 5: Making the plot
png(filename = "plot2.png",width = 480, height = 480, units = "px")
with(epcdays, plot(finaltime,Global_active_power, xlab = "Day", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()
