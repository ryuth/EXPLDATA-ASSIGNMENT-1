## Loading full dataset (Step 1)

data_set <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259)


## Formatting the date. (Step 2)

data_set$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data (Step 3)

data <- subset(data_set, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates into the desired format, which is "YYYY-MM-DD" (Step 4)

datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datatime)


## Plot 1 (Step 5)

hist(data$Global_active_power, breaks = 11, include.lowst = TRUE, main = "Global Active Power", axes = TRUE, plot = TRUE,
xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")


## Saving file (Step 6)

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
