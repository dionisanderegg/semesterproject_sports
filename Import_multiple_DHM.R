library(raster)
library(tidyverse)

DHM_URL <- read_csv("DHM_SG.csv", col_names = FALSE)

r.list <- list()
for(i in 1:length(DHM_URL$X1)){  
  r.list[[i]] <- raster(DHM_URL$X1[i])  
} 

m <- do.call(merge, r.list)

plot(m)

data.matrix <- as.data.frame(rasterToPoints(m))

test <- data.matrix[1:100,]

write_csv(data.matrix, file = "DHM.csv")


is.data.frame(test)
