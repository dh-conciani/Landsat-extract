## Post processing and data management of 'match_extract' algorithm
## Dhemerson Conciani (dh.conciani@gmail.com)

## Read packages
library (stringr)
library (lubridate)
library (tools)

## Add NA's to Aerosol in TM and ETM+ Sensor
TM_data_entries$Aerosol  = NA
ETM_data_entries$Aerosol = NA
TM_non_burned$Aerosol    = NA
ETM_non_burned$Aerosol   = NA

## Build a unified data.frame between all sensors
BA_reflectance <- data.frame (NULL)
BA_reflectance <- rbind (TM_data_entries, ETM_data_entries, OLI_data_entries)
NBA_reflectance <- data.frame (NULL)
NBA_reflectance <- rbind (TM_non_burned, ETM_non_burned, OLI_non_burned)

## Rename columns
names(BA_reflectance)[1] <- "Scene"
names(NBA_reflectance)[1] <- "Scene"
names(BA_reflectance)[2] <- "Date"
names(NBA_reflectance)[2] <- "Date"
names(BA_reflectance)[3] <- "Sensor"
names(NBA_reflectance)[3] <- "Sensor"
names(BA_reflectance)[5] <- "Cell.POS"
names(NBA_reflectance)[5] <- "Cell.POS"

## Insert local
Local <- rep ("Itirapina", nrow(BA_reflectance))
BA_reflectance$Local <- Local
Local <- rep ("Itirapina", nrow(NBA_reflectance))
NBA_reflectance$Local <- Local

## Remove /*temp
rm (TM_data_entries, ETM_data_entries, OLI_data_entries,
    TM_non_burned, ETM_non_burned, OLI_non_burned, Local)
