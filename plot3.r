## Getting full sub_dataset of power consumption sub_data

power_consump_full_sub_data <- read.csv("./sub_data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 

                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

power_consump_full_sub_data$Date <- as.Date(power_consump_full_sub_data$Date, format="%d/%m/%Y")




## getting sub_data covering 2007-02-01 to 2007-02-02sub_sub_data

sub_data <- subset(power_consump_full_sub_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(power_consump_full_sub_data)




## Now, we need to convert dates

datetime <- paste(as.Date(sub_data$Date), sub_data$Time)

sub_data$Datetime <- as.POSIXct(datetime)




## Plot and Create png

with(sub_data, {

    plot(Sub_metering_1~Datetime, type="l",

         ylab="Global Active Power (kilowatts)", xlab="")

    lines(Sub_metering_2~Datetime,col='Red')

    lines(Sub_metering_3~Datetime,col='Blue')

})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 

       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))




## Saving

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
