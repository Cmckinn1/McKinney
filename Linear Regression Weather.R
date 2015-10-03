library("weatherData")

SA = getStationCode("San Antonio")

SA.Weather = getSummarizedWeather("KSAT", "2014-09-16", "2015-09-16", opt_all_columns = T)

SAW = SA.Weather 

hist(SAW$Max_TemperatureF)

lm1 = lm(SAW$Mean_TemperatureF ~ SAW$Mean_Humidity)

summary(lm1)

plot(lm1)
