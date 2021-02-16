#extract text file to the working directory
#transform the text file into a data frame
raw_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                        na.strings = "?")
#processing data
my_data <- subset(raw_data, Date %in% c("1/2/2007","2/2/2007"))
my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")

#creating png file
png("plot1.png")
hist(my_data$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()