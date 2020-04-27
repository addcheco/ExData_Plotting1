#Open file from zip file and format 
data <- unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt") #open data from zip
reformdata <- read.table(data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec= ".") #organize data 
importantdata <- reformdata[reformdata$Date %in% c("1/2/2007", "2/2/2007") ,]
#only from Feb1-Feb2

png("plot2.png", width=480, height=480) #export as image
NumGlobal <- as.numeric(importantdata$Global_active_power)
#make the variable numeric
reformdate <- strptime(paste(importantdata$Date, importantdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#reformat date to day,month,year hour,minute,second
plot(reformdate, NumGlobal, xlab="", ylab="Global Active Power (kilowatts)", type= "l")
dev.off() #sign out
