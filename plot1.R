#Open file from zip file and format 
data <- unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt") #open data from zip
reformdata <- read.table(data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec= ".") #organize data 
importantdata <- reformdata[reformdata$Date %in% c("1/2/2007", "2/2/2007") ,]
#only from Feb1-Feb2

NumGlobal <- as.numeric(importantdata$Global_active_power)
#make the variable numeric
hist(NumGlobal,main="Global Active Power", col = 2, xlab="Global Active Power (kilowatts)")
#The histogram is made to match Plot 1
png("plot1.png", width=480, height=480) #export as image
dev.off() #always turn off

