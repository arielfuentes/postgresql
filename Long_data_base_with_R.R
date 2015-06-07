#libraries
library(ff)
library(ETLUtils)
library(RPostgreSQL)

#login
login <- list()
login$user <- "postgres"
login$password <- "admin"
login$dbname <- "bip"
login$host <- "localhost"

#dias
n <- read.dbi.ffdf(
  query = "select count(distinct(date(tiempo_subida))) 
  from etapas_2013 where tipo_dia = 'Laboral'", 
  dbConnect.args = list(drv = dbDriver("PostgreSQL"), dbname = login$dbname, 
                        user = login$user, password = login$password, 
                        host = login$host), VERBOSE=TRUE)
nday  <- as.data.frame(n)
rm(n)
