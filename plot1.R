data<-read.csv("household_power_consumption.txt", sep=";")
is.na(data)<-data=="?"
newdata<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),] 
newdata$Global_active_power<-as.numeric(as.character(newdata$Global_active_power))
newdata$Global_reactive_power<-as.numeric(as.character(newdata$Global_reactive_power))
newdata$Voltage<-as.numeric(as.character(newdata$Voltage))
newdata$Global_intensity<-as.numeric(as.character(newdata$Global_intensity))
newdata$dt<-paste(newdata$Date, newdata$Time)
newdata$dt<-strptime(newdata$dt, "%d/%m/%Y %H:%M:%S")
png(file = "plot1.png", width = 480, height = 480)
hist(newdata$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()