#plot 1 Global Active Power

setwd("C:/Users/Bao Xinwei/Desktop/R/exploratory")
library(dplyr)
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
dt <- tbl_df(df)
dt <- mutate(dt, Date = as.Date(Date, "%d/%m/%Y"))
dt1 <- filter(dt, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
dt1 <- mutate(dt1, Global_active_power = as.numeric(Global_active_power))
hist(dt1$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
