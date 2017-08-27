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

## Plot 2
plot(data_sub$Global_active_power~data_sub$Datetime, type="1", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
