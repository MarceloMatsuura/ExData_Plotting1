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
png("plot2.png")
with(my_data,plot(Global_active_power~Datetime, type="l", 
                  ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()