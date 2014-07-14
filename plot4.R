##READING DATA
datos <- read.table("household_power_consumption.txt", sep=';', header=T)
head(datos)
as.character(datos$Time)
datos$Time <- strptime(datos$Time, format="%H:%M:%S")
datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")
datos1 <- subset(datos,Date>="2007-02-01" & Date<="2007-02-02")

## comand para unir  los gr??ficos

par(mfcol=c(2,2),mar=c(4,4,2,2))

## datos de gr??fico 2

datos2 <- datos1$Global_active_power
datosglob <- subset(datos2, datos2 != "?")


datosglob <- as.numeric(as.character(datosglob))
plot(datosglob, type= "l", xaxt="n",ylab="Global Active Power (kilowatt)",xlab="")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

## datos de gr??fico 3

datos1$Sub_metering_1 <- as.numeric(as.character(datos1$Sub_metering_1))
datos1$Sub_metering_2 <- as.numeric(as.character(datos1$Sub_metering_2))
datos1$Sub_metering_3 <- as.numeric(as.character(datos1$Sub_metering_3))

plot(datos1$Sub_metering_1, type= "l", xaxt="n",ylab="Energy sub metering",xlab="")
lines(datos1$Sub_metering_2, col="red")
lines(datos1$Sub_metering_3, col="blue")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.7,bty="n")

## comandos para el gr??fico de arriba a la derecha (voltaje)
head(datos1)
datos1$Voltage <- as.numeric(as.character(datos1$Voltage))
plot(datos1$Voltage, type= "l", xaxt="n",ylab="Voltage", xlab="datetime")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

## comands para el gr??fico de abajo a la izquierda

datos1$Global_reactive_power <- as.numeric(as.character(datos1$Global_reactive_power))
plot(datos1$Global_reactive_power, type= "l", xaxt="n",ylab="Global_reactive_power", xlab="datetime")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

dev.copy(png, file="plot4.png",width=480,height=480)
dev.off()
