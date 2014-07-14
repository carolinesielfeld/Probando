##READING DATA
datos <- read.table("household_power_consumption.txt", sep=';', header=T)
head(datos)
as.character(datos$Time)
datos$Time <- strptime(datos$Time, format="%H:%M:%S")
datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")
datos1 <- subset(datos,Date>="2007-02-01" & Date<="2007-02-02")
summary(datos1)

datos2 <- datos1$Global_active_power
datosglob <- subset(datos2, datos2 != "?")
summary(datosglob)
par(mfcol=c(1,1),mar=c(4,5,4,4))
datosglob <- as.numeric(as.character(datosglob))
hist(datosglob,main="Global Active power", col="red", xlab="Global Active Power (kilowatt)")
?hist()
dev.copy(png, file="plot1.png",width=480,height=480)
dev.off()
