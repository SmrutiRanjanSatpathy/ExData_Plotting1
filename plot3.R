#
#Reading whole set of data & assigning NA where it finds "?"
#
plotdata<-read.table("household_power_consumption.txt"
                     ,header = TRUE,sep = ";",na.strings = "?")
#
#Converting Date variable into Date format
#
plotdata<-transform(plotdata,Date=as.Date(Date,"%d/%m/%Y"))
#
#Converting Time variable into POISXlt format
#
plotdata<-transform(plotdata,Time=
                      strptime(paste(Date,Time),format = "%Y-%m-%d %H:%M:%S"))
#
#Getting rid of unnecessary data
#
plotdata<-subset(plotdata
                 ,plotdata$Date=="2007-02-01" | plotdata$Date=="2007-02-02")
#
# plotting the area without putting data
#
with(plotdata,plot(Time,Sub_metering_1
                   ,xlab="",ylab="Energy sub metering",type = "n"))
#
#Putting 3 sets of data with line
#

lines(plotdata$Time,plotdata$Sub_metering_1,col="black")
lines(plotdata$Time,plotdata$Sub_metering_2,col="red")
lines(plotdata$Time,plotdata$Sub_metering_3,col="blue")
#
#Assigning legend on topleft
#
legend("topright"
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=1,col=c("black","red","blue"))
#
#Copy it into .png format
#
dev.copy(png,file="plot3.png")   #Default png is 480 * 480
dev.off()
