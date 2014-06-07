Sys.setlocale("LC_TIME","English")
pwr<-read.csv2("./household_power_consumption.txt",dec=".",na.strings="?")
pwr<-pwr[as.Date(pwr$Date,"%d/%m/%Y")=="2007-02-01" | 
             as.Date(pwr$Date,"%d/%m/%Y")=="2007-02-02",]
pwr['DateTime'] <- paste(pwr$Date, pwr$Time)
pwr$DateTime<-strptime(pwr$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480)
par(mfrow = c(1,1))

plot(
    pwr$DateTime,
    pwr$Sub_metering_1,
    type="n",
    main="",
    ylab="Energy Sub Meeting",
    xlab="")
points(pwr$DateTime,pwr$Sub_metering_1,type="l",col="black")
points(pwr$DateTime,pwr$Sub_metering_2,type="l",col="red")
points(pwr$DateTime,pwr$Sub_metering_3,type="l",col="blue")
legend("topright", lty = c(1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()