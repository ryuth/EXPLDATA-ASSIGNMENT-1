## Loading full dataset (Step 1)

data_set <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259)


## Formatting the date. (Step 2)

data_set$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data (Step 3)

data <- subset(data_set, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates into the desired format, which is "YYYY-MM-DD" (Step 4)

datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datatime)

## Plot 3 (Step 5)

with(data, {
    plot(Sub_metering_1~datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Saving File (Step 6)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

