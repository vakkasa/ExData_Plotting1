Sys.setlocale("LC_TIME","English")
pwr<-read.csv2("./household_power_consumption.txt",dec=".",na.strings="?")
pwr<-pwr[as.Date(pwr$Date,"%d/%m/%Y")=="2007-02-01" | 
             as.Date(pwr$Date,"%d/%m/%Y")=="2007-02-02",]
pwr['DateTime'] <- paste(pwr$Date, pwr$Time)
pwr$DateTime<-strptime(pwr$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(pwr$DateTime, pwr$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

plot(pwr$DateTime, pwr$Voltage, type="l",xlab = "datetime")

plot(pwr$DateTime, pwr$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
points(pwr$DateTime,pwr$Sub_metering_1,type="l",col="black")
points(pwr$DateTime,pwr$Sub_metering_2,type="l",col="red")
points(pwr$DateTime,pwr$Sub_metering_3,type="l",col="blue")
legend("topright", lty = c(1,1), bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(pwr$DateTime, pwr$Global_reactive_power, type="l",xlab = "datetime")

dev.off()