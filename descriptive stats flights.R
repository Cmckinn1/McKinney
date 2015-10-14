library(dplyr)
library(moments)
library(DBI)
library(RPostgreSQL)
library(plotrix)
library(randomForest)

D <- dbDriver("PostgreSQL")

flights.db = src_postgres(dbname = "flights", host = "localhost", port = 5432, user = "postgres", password = "2011superduty")

flights <- tbl(flights.db, "connections")

flights.data <- flights %>%
  select(Year, Month, ArrDelay) %>%
  filter(Year == 2010) %>%
  collect() %>%
  group_by(Month) %>%
  summarise(
    count = n(),
    sum = sum(ArrDelay, na.rm = TRUE),
    min = min(ArrDelay, na.rm = TRUE),
    max = max(ArrDelay, na.rm = TRUE),
    mean = mean(ArrDelay, na.rm = TRUE),
    median = median(ArrDelay, na.rm = TRUE),
    range = max - min,
    sd = sd(ArrDelay, na.rm = TRUE),
    var = var(ArrDelay, na.rm = TRUE),
    se = std.error(ArrDelay, na.rm = TRUE),
    kurt = kurtosis(ArrDelay, na.rm = TRUE),
    skew = skewness(ArrDelay, na.rm = TRUE)
  )
