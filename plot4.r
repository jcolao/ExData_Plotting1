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



## Plot and power_consump_full_dataCreate png

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(sub_data, {

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




## Saving phase

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
