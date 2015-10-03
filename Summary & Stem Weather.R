library("weatherData")

SA = getStationCode("San Antonio")

SA.Weather = getSummarizedWeather("KSAT", "2014-09-16", "2015-09-16", opt_all_columns = T)

SAW = SA.Weather

stem(SAW$Mean_TemperatureF)

summary(SAW$Mean_TemperatureF)
