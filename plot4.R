setwd('/Users/Thor/Documents/Coursera/exdaan/')

library(dplyr)
library(data.table)

dat <- fread('household_power_consumption.txt', sep = ';', stringsAsFactors = FALSE, header = TRUE)
dat <- subset(dat, dat$Date == '1/2/2007' | dat$Date == '2/2/2007')

dat <- dat %>% mutate(times = as.POSIXct(strptime(paste(dat$Date, dat$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')))

dat$Global_active_power = as.numeric(dat$Global_active_power)
dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)
dat$Global_reactive_power <- as.numeric(dat$Global_active_power)
dat$Voltage <- as.numeric(dat$Voltage)

par(mfcol=c(2,2),mar=c(4,4,1,1))


#Global reactive power
with(dat, plot(times, Global_active_power, ylab='Global_active_power',
               xlab = '', type = 'l'
               ))
#Sub metering
with(dat, {
  plot(times, Sub_metering_1, type='l', col = 'black', 
       xlab = '', ylab = 'Energy sub metering')
  points(times, Sub_metering_2, type='l', col = 'red')
  points(times, Sub_metering_3, type='l', col = 'blue')
  legend('topright', lty=1, col = c('black','red','blue'),
         legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
})
#Voltage
with(dat, plot(times, Voltage, ylab='Voltage',
               xlab = 'datetime', type = 'l'
))
#Global Reactive Power
with(dat, plot(times, Global_reactive_power, ylab='Global_reactive_power',
               xlab = 'datetime', type = 'l'
))




dev.copy(png, file='plot4.png', width=480, height=480)
dev.off()
