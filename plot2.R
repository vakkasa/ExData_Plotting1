Sys.setlocale("LC_TIME","English")
pwr<-read.csv2("./household_power_consumption.txt",dec=".",na.strings="?")
pwr<-pwr[as.Date(pwr$Date,"%d/%m/%Y")=="2007-02-01" | 
             as.Date(pwr$Date,"%d/%m/%Y")=="2007-02-02",]
pwr['DateTime'] <- paste(pwr$Date, pwr$Time)
pwr$DateTime<-strptime(pwr$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)
par(mfrow = c(1,1))

plot(
    pwr$DateTime,
    pwr$Global_active_power,
    type="l",
    main="",
    ylab = "Global Active Power (kilowatts)",
    xlab = "")

dev.off()