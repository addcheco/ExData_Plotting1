#Open file from zip file and format 
data <- unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt") #open data from zip
reformdata <- read.table(data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec= ".") #organize data 
importantdata <- reformdata[reformdata$Date %in% c("1/2/2007", "2/2/2007") ,]
#only from Feb1-Feb2

reformdate <- strptime(paste(importantdata$Date, importantdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#reformat date to day,month,year hour,minute,second
plot(reformdate, importantdata$Sub_metering_1, type="l", ylim=c(0,40), ylab="Energy sub metering", xlab=" ")
par(new=TRUE)
plot(reformdate, importantdata$Sub_metering_2, type="l", col=4, ylim=c(0,40), ylab="Energy sub metering", xlab=" ")
par(new=TRUE)
plot(reformdate, importantdata$Sub_metering_3, type="l", col=2, ylim=c(0,40), ylab="Energy sub metering", xlab=" ")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
png("plot3.png", width=480, height=480) #export as image
dev.off() #sign out