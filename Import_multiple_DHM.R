library(raster)
library(tidyverse)
library(tiff)
library(sf)

DHM_URL <- read_csv("DHM_Gemeinden.csv", col_names = FALSE)

r.list <- list()
for(i in 1:length(DHM_URL$X1)){  
  r.list[[i]] <- raster(DHM_URL$X1[i])  
} 

m <- do.call(merge, r.list)
plot(m)

# Takes up to 5 hours...! => Extract only the points in df "full" possible?
data.matrix <- as.data.frame(rasterToPoints(m))

names(data.matrix)[names(data.matrix) == "x"] <- "x_round"
names(data.matrix)[names(data.matrix) == "y"] <- "y_round"

data.matrix[]