#plot 2

setwd("C:/Users/Bao Xinwei/Desktop/R/exploratory")
library(dplyr)
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
dt <- tbl_df(df)
dt <- mutate(dt, Date_Time = as.POSIXlt(paste(Date,Time), format="%d/%m/%Y %H:%M:%OS"))
dt <- mutate(dt, Date = as.Date(Date, format = "%d/%m/%Y"))
dt1 <- filter(dt, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
dt1 <- mutate(dt1, Global_active_power = as.numeric(Global_active_power))
plot(x = dt1$Date_Time, 
     y = dt1$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power(kilowatts)", 
     xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()