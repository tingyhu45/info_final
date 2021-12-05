#! /usr/bin/env Rscript

here::i_am('R/make_figure1.R')

# load in processed data
vaccine_processed <- read.csv(here::here("data","vaccine_output.csv"))

# plot the map with total vaccination 
library(ggplot2)
png(here::here("figure","figure1.png"))

ggplot(vaccine_processed, aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill= TOTAL_VACCINATIONS_PER100), colour = "white") +
  scale_x_continuous(breaks = seq(-180, 210, 45), labels = function(x){paste0(x, "°")}) +
  scale_y_continuous(breaks = seq(-60, 100, 30), labels = function(x){paste0(x, "°")}) +
  scale_fill_gradient(low = "lightblue", high="steel blue") +
  labs(title="Total Vaccinations per 100 Across Countries", y="Latitude", x="Longitude") + theme_light() +
  theme(legend.key.size = unit(18, "pt"),legend.title=element_text(size=8),legend.position = "bottom") + coord_fixed() 

dev.off()

