#plot 3

setwd("C:/Users/Bao Xinwei/Desktop/R/exploratory")
library(dplyr)
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
dt <- tbl_df(df)
dt <- mutate(dt, Date_Time = as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%OS"))
dt <- mutate(dt, Date = as.Date(Date, format = "%d/%m/%Y"))
dt1 <- filter(dt, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
dt1 <- mutate(dt1, Global_active_power = as.numeric(Global_active_power))
plot(x = dt1$Date_Time, 
     y = dt1$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "")
lines(x=dt1$Date_Time, y=dt1$Sub_metering_2,type="l",col="red")
lines(x=dt1$Date_Time, y=dt1$Sub_metering_3,type="l",col="blue")
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"),
       lty = 1,
       cex=0.7)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()