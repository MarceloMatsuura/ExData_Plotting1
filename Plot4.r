#extract text file to the working directory
#transform the text file into a data frame
raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                       na.strings = "?")
#processing data
my_data <- subset(raw_data, Date %in% c("1/2/2007","2/2/2007"))
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(my_data$Date), my_data$Time)
my_data$Datetime <- as.POSIXct(datetime)

#creating png file
png("plot4.png")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(my_data, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()