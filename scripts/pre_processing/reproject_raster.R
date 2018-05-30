## Reproject a list of rasters
## Dhemerson Conciani (dh.conciani@gmail.com)

# Read packages
library (raster)
library (rgdal)
library (tools)

# Read archive with reference projection (In this example, a shapefile)
reference <- shapefile ("H:/shps/limites/buffer.shp")

# Get reference projection
ref_proj <- crs(reference)

# Get the list of rasters
raster_list <- list.files(path = 'H:/machine_learning/img_croped/', pattern = '.tif$', full.names = T)
list_count <- length(raster_list)
list_names <- file_path_sans_ext(basename(raster_list))

## Reproject stacks
for (i in 1:list_count) {
  #read in raster
  r <- stack(raster_list[[i]])
  #perform crop
  croped_raster <- projectRaster (r, crs = ref_proj)
  #write each reprojected raster to a new file 
  writeRaster(croped_raster, paste0 ('H:/machine_learning/img_reprojected/',list_names[i],'.tif'), overwrite=TRUE)
}
