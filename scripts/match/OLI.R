## Match list of rasters and Spatial Polygons using string parameter
## Extract cell values in stack 
## Runs on Landsat 8 (OLI) sensor
## Dhemerson Conciani (dh.conciani@gmail.com)

## Read packages
library (raster)
library (rgdal)
library (tools)
library (lubridate)
library (stringr)
library (dplyr)

## Map rasters and polygons location into a list
raster_loc <- list.files(path = 'H:/machine_learning/img_reprojected/OLI/', pattern = '.tif$', full.names = T)
poly_loc <- list.files(path = 'H:/machine_learning/vectors/', pattern = '.shp$', full.names = T)

# Get only basenames
raster_list_names <- file_path_sans_ext(basename(raster_loc))
poly_list_names <- file_path_sans_ext(basename(poly_loc))

## Extract dates from string names
raster_dates = sapply(substr(raster_list_names, start=16, stop=25), function(x) x)
poly_dates = sapply(substr(poly_list_names, start=1, stop=10), function(x) x)

## Replace "_" separators for "-" used in date variables
raster_dates = sapply(gsub("_", "-", raster_dates), function(x) x)
poly_dates = sapply(gsub("_", "-", poly_dates), function(x) x)

## Convert character variables into date
raster_dates <- ymd (raster_dates)
poly_dates <- ymd (poly_dates)

## Make data_frames
df_raster = data.frame (raster_loc, raster_dates)
df_poly = data.frame (poly_loc, poly_dates)

## Rename date columns to same var
colnames(df_raster)[2] <- "date"
colnames(df_poly)[2] <- "date"

## Match date coincidences between rasters and polygons
matchs <- left_join(df_raster, df_poly, by= "date")

## Remove non-match rows (unburned; cloudy; noData)
matchs <- na.omit (matchs)

## Build a list with matchs data.frame
r_list <- as.character (matchs$raster_loc)
p_list <- as.character (matchs$poly_loc)
date_list <- as.character (matchs$date)
sensor_list <- rep ("OLI", length(r_list))

## List length, used to build 'for'
list_count <- length (r_list)

# Create a data.frame to receive data
OLI_data_entries <- data.frame (NULL)

## Extract values for each stack and build a data.frame
for (i in 1:list_count) {
  #read stack
  r <- stack(r_list[[i]])
  #extract only basename
  bname <- file_path_sans_ext(basename(r_list[[i]]))
  #define band names
  names(r) <- c("Aerosol", "Blue", "Green", "Red", "NIR", "SWIR1", "SWIR2")
  #read shapefile
  r_poly <- shapefile(p_list[[i]])
  #read date
  date <- date_list[[i]]
  ##read sensor
  sensor <- sensor_list[[i]]
  ## extract values
  temp <- extract(r, r_poly, cellnumbers=TRUE, df=TRUE)
  temp <- data.frame (bname, date, sensor, temp)
  ## build data.frame
  OLI_data_entries <- rbind (OLI_data_entries, temp)
}

## Extract same length data for non-burned areas
## Import reference Polygon
ref_shp <- shapefile ("H:/machine_learning/vectors/reference.shp")

## Calc number of random points per scene
scene_points <- nrow(OLI_data_entries) /nlevels(OLI_data_entries$bname)

## Create empty data.frame for non-burned data
OLI_non_burned <- data.frame (NULL)

## Extract values from random points in non-burned areas for each scene
for (i in 1:list_count) {
  #read stack
  r <- stack(r_list[[i]])
  #extract only basename
  bname <- file_path_sans_ext(basename(r_list[[i]]))
  #define band names
  names(r) <- c("Aerosol", "Blue", "Green", "Red", "NIR", "SWIR1", "SWIR2")
  #read shapefile
  r_poly <- shapefile(p_list[[i]])
  #read date
  date <- date_list[[i]]
  ##read sensor
  sensor <- sensor_list[[i]]
  ##erase burned area
  hole <- gDifference(ref_shp, r_poly)
  ##create random points in non-burned area
  p_nba <- spsample (hole, n=scene_points, type="random")
    ## extract values
  temp <- extract(r, p_nba, cellnumbers=TRUE, df=TRUE)
  temp <- data.frame (bname, date, sensor, temp)
  ## build data.frame
  OLI_non_burned <- rbind (OLI_non_burned, temp)
}

## Remove /$~temp objects
rm (df_poly, df_raster, poly_dates, poly_list_count, poly_list_names, 
    poly_loc, raster_dates, raster_list_count, raster_list_names, 
    raster_loc, r_list, p_list, list_count, r, bname, r_poly, temp, matchs,
    i, date_list, sensor_list, date, sensor, hole, p_nba, ref_shp, scene_points)
