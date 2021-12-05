#! /usr/bin/env Rscript

here::i_am('R/data_processing.R')


## Load and process data
# read in data
vaccine <- read.csv(here::here("data","vaccination-data.csv"))

# deal with missing values: impute with mean of variables
fun1<- function(x) {x[is.na(x)] <- mean(x, na.rm = TRUE)
x}
vaccine$TOTAL_VACCINATIONS_PER100 <- fun1(vaccine$TOTAL_VACCINATIONS_PER100)
vaccine$PERSONS_FULLY_VACCINATED_PER100 <- fun1(vaccine$PERSONS_FULLY_VACCINATED_PER100)

## prepare data for map plot
library (maps)
library (mapdata)
library(ggplot2)
world_map<-map_data("world")

#deal with country variables
vaccine$COUNTRY<- gsub("United States of America","USA",vaccine$COUNTRY)
vaccine$COUNTRY<- gsub("The United Kingdom","United Kingdom",vaccine$COUNTRY)
vaccine$COUNTRY<- gsub("Russian Federation","Russia",vaccine$COUNTRY)

# merge data for map
library(dplyr)

world_map %>% 
  left_join(vaccine, by = c("region" = "COUNTRY")) -> vaccine_world_map

## save processed data
write.csv(vaccine_world_map,file=here::here("data","vaccine_output.csv"))