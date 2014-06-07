Sys.setlocale("LC_TIME","English")
pwr<-read.csv2("./household_power_consumption.txt",dec=".",na.strings="?")
pwr<-pwr[as.Date(pwr$Date,"%d/%m/%Y")=="2007-02-01" | 
        as.Date(pwr$Date,"%d/%m/%Y")=="2007-02-02",]

png(file = "plot1.png", width = 480, height = 480)
par(mfrow = c(1,1))

hist(
    pwr$Global_active_power,
    col="red",
    xlab="Global Active Power (kilowatts)",
    main="Global Active Power")

dev.off()