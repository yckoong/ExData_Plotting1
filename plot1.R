## Getting full dataset
library(readr)
data_full <- read_delim("C:/Users/yckoong/Desktop/exdata_2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", 
                        ";", escape_double = FALSE, trim_ws = TRUE)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data_sub <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data_sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
