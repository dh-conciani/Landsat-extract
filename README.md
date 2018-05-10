Match raster and Polygons - Extract values and calc spectral indexes

# Scripts
### Pre processing:

`crop_raster` Crop extent of raster list to gain processing time

`reproject_raster` Check projections and reproject raster list to reference CRS

### Match:

Extract all pixel values into a raster matched with polygon by date
and leatorize points outside your polygon and inside your raster

`TM` Thematic Mapper sensor (Landsat 5)

`ETM` Enhanced Thematic Mapper Plus (Landsat 7)

`OLI` Operation Land Imager (Landsat 8)

### Post processing:

Calculates NDVI, EVI, SAVI, NDMI, NBR and NBR for extracted data
Organize data.frames for machine learning process
```
calc_indexes.R
organize_array.R
```

# Final data

Example in `data` folder
