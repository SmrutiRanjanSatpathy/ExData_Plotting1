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
with(plotdata,plot(Time,Global_active_power
         ,xlab="",ylab="Global Active Power (Kilowatts)",type = "n"))
#
#Putting data with line
#
lines(plotdata$Time,plotdata$Global_active_power)

#
#Copy it into .png format
#
dev.copy(png,file="plot2.png")   #Default png is 480 * 480
dev.off()
