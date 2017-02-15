setwd('/Users/Thor/Documents/Coursera/exdaan/')

library(dplyr)
library(data.table)

dat <- fread('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, header = TRUE)

dat$Date <- as.Date(dat$Date, format='%d/%m/%Y')
dat <- subset(dat, dat$Date == '2007-02-01' | dat$Date == '2007-02-02')

dat$Global_active_power = as.numeric(dat$Global_active_power)

with(dat, hist(Global_active_power, col = 'red', main = 'Global Active Power', 
               xlab = 'Global Active Power (kilowatts)'))

