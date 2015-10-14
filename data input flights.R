library(DBI)
library(dplyr)
require("RpostgreSQL")

con <- dbConnect(RPostgreSQL::PostgreSQL(), dbname = 'flights',
                 host = 'localhost',
                 port = '5432',
                 user = 'postgres',
                 password = '2011superduty')
 
data.source <- list.files(path = "Data",
                          pattern = "*.csv",
                          full.names = TRUE,
                          recursive = TRUE,
                          ignore.case = TR
                          UE)
 

for(i in data.source){
  print(i)
  print("Read file...")
  fl <- read.csv(file = i, header = TRUE, stringsAsFactors = FALSE)    
  #file = i, header = TRUE, stringsAsFactors = FALSE)
  print("Write file to DB...")
  fl <- fl %>% select(Year:Div1TailNum)
  dbWriteTable(con, name = "connections", fl, append = TRUE)
  print("Next...")
}
