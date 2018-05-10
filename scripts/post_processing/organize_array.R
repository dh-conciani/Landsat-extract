## Post processing and data management of 'match_extract' algorithm
## Dhemerson Conciani (dh.conciani@gmail.com)

## Read packages
library (stringr)
library (lubridate)
library (tools)

## Add NA's to Aerosol in TM and ETM+ Sensor
TM_data_entries$Aerosol  = NA
ETM_data_entries$Aerosol = NA

## Build a unified data.frame between all sensors
BA_reflectance <- data.frame (NULL)
BA_reflectance <- rbind (TM_data_entries, ETM_data_entries, OLI_data_entries)

## Rename columns
names(BA_reflectance)[1] <- "Scene"
names(BA_reflectance)[2] <- "Date"
names(BA_reflectance)[3] <- "Sensor"
names(BA_reflectance)[5] <- "Cell.POS"

## Insert local
Local <- rep ("Itirapina", nrow(BA_reflectance))
BA_reflectance$Local <- Local

## Insert spectral indexes
BA_reflectance$NDVI = NDVI
BA_reflectance$EVI  = EVI
BA_reflectance$SAVI = SAVI
BA_reflectance$NDMI = NDMI
BA_reflectance$NBR  = NBR
BA_reflectance$NBR2 = NBR2

## Remove */~temp archives
rm (TM_data_entries, ETM_data_entries, OLI_data_entries, Local, 
    NDVI, EVI, SAVI, NDMI, NBR, NBR2)

## Export data.frame
write.table(BA_reflectance, "H:/machine_learning/BA_data.txt", sep="\t")


