Match raster and Polygons - Extract values and calc spectral indexes

# Scripts
* Pre processing:
Prepare your data, check projections and crop extent to gain processing time
```
Reproject Scenes
Crop Scenes
```

* Match:
Extract all pixel values into a raster matched with polygon by date
Aleatorize points outside your polygon and inside your raster
```
TM sensor
ETM+ sensor
OLI sensor
```

* Post processing:
Calculates NDVI, EVI, SAVI, NDMI, NBR and NBR for extracted data
```
Organize data.frames for machine learning process
Calc spectral indexes
Organize array
```
