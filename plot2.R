##READING DATA
datos <- read.table("household_power_consumption.txt", sep=';', header=T)


datos$Time <- strptime(datos$Time, format="%H:%M:%S")
datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")
datos1 <- subset(datos,Date>="2007-02-01" & Date<="2007-02-02")
summary(datos1)

datos2 <- datos1$Global_active_power
datosglob <- subset(datos2, datos2 != "?")


datosglob <- as.numeric(as.character(datosglob))
par(mfcol=c(1,1),mar=c(5,5,5,5))
plot(datosglob, type= "l",main="Global Active power", xaxt="n",ylab="Global Active Power (kilowatt)",xlab="")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"),side=1)

dev.copy(png, file="plot2.png",width=480,height=480)
dev.off()
