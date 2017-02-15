setwd('/Users/Thor/Documents/Coursera/exdaan/')

library(dplyr)
library(data.table)

dat <- fread('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, header = TRUE)
dat <- subset(dat, dat$Date == '1/2/2007' | dat$Date == '2/2/2007')

dat <- dat %>% mutate(times = as.POSIXct(strptime(paste(dat$Date, dat$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')))

dat$Global_active_power = as.numeric(dat$Global_active_power)

with(dat, plot(times, Global_active_power, type='l', col = 'black', 
               xlab = '',
               ylab = 'Global Active Power (kilowatts)'))

dev.copy(png, file='plot2.png', width=480, height=480)
dev.off()
