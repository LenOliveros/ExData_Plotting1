
# Step 1: iniciate the connection to the directory
connection <- "C:/Users/DANTEROUS-/Documents/LEN OLIVEROS/Programa especializado Data Scientist coursera/4. Exploratory Data Analysis"
getwd()
setwd(connection)

# Step 2: read the data
epc <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
head(epc)
# Step 3: Convert the Date variable into date class
epc$Date <- dmy(epc$Date)

class(epc$Date)
# Step 4: Conver the Global active power into a numeric variable
epc$Global_active_power <- as.numeric(epc$Global_active_power)


#Step 5: Extract only complete values from the data frame
epcdatos <- epc[complete.cases(epc),]
head(epcdatos)


# Step 6: Subsetting the data acording to the interest
epcons <- subset(epcdatos,Date == "2007-02-01"| Date == "2007-02-02")


# Step 7: Opening the PNG Device and create the Graphic
png(filename = "plot1.png",width = 480, height = 480, units = "px")

with(epcons,hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency",main = "Global Active Power"))
dev.off()
