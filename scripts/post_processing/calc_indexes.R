## Calc spectral indexes in a Reflectance array
## Dhemerson Conciani (dh.conciani@gmail.com)
## Equations in (https://landsat.usgs.gov/sites/default/files/documents/si_product_guide.pdf)

## For burned Areas

## NDVI - Normalized Difference Vegetation Index
NDVI = ((BA_reflectance$NIR - BA_reflectance$Red) / (BA_reflectance$NIR + BA_reflectance$Red))

## EVI - Enhanced Vegetation Index
EVI = 2.5 * ((BA_reflectance$NIR - BA_reflectance$Red) / (BA_reflectance$NIR + 6 * BA_reflectance$Red - 7.5 * BA_reflectance$Blue +1))

## SAVI - Soil Adjusted Vegetation Index
SAVI = ((BA_reflectance$NIR - BA_reflectance$Red) / (BA_reflectance$NIR + BA_reflectance$Red + 0.5)) * (1 + 0.5)

## NDMI - Normalized Difference Moisture Index
NDMI = (BA_reflectance$NIR - BA_reflectance$SWIR1) / (BA_reflectance$NIR + BA_reflectance$SWIR1)

## NBR - Normalized Burn Ratio
NBR = ((BA_reflectance$NIR - BA_reflectance$SWIR1) / (BA_reflectance$NIR + BA_reflectance$SWIR1))

## NBR2
NBR2 = (BA_reflectance$SWIR1 - BA_reflectance$SWIR2) / (BA_reflectance$SWIR1 + BA_reflectance$SWIR2)

## Insert spectral indexes
BA_reflectance$NDVI = NDVI
BA_reflectance$EVI  = EVI
BA_reflectance$SAVI = SAVI
BA_reflectance$NDMI = NDMI
BA_reflectance$NBR  = NBR
BA_reflectance$NBR2 = NBR2

## NDVI - Normalized Difference Vegetation Index
NDVI = ((NBA_reflectance$NIR - NBA_reflectance$Red) / (NBA_reflectance$NIR + NBA_reflectance$Red))

## EVI - Enhanced Vegetation Index
EVI = 2.5 * ((NBA_reflectance$NIR - NBA_reflectance$Red) / (NBA_reflectance$NIR + 6 * NBA_reflectance$Red - 7.5 * NBA_reflectance$Blue +1))

## SAVI - Soil Adjusted Vegetation Index
SAVI = ((NBA_reflectance$NIR - NBA_reflectance$Red) / (NBA_reflectance$NIR + NBA_reflectance$Red + 0.5)) * (1 + 0.5)

## NDMI - Normalized Difference Moisture Index
NDMI = (NBA_reflectance$NIR - NBA_reflectance$SWIR1) / (NBA_reflectance$NIR + NBA_reflectance$SWIR1)

## NBR - Normalized Burn Ratio
NBR = ((NBA_reflectance$NIR - NBA_reflectance$SWIR1) / (NBA_reflectance$NIR + NBA_reflectance$SWIR1))

## NBR2
NBR2 = (NBA_reflectance$SWIR1 - NBA_reflectance$SWIR2) / (NBA_reflectance$SWIR1 + NBA_reflectance$SWIR2)

## Insert spectral indexes
NBA_reflectance$NDVI = NDVI
NBA_reflectance$EVI  = EVI
NBA_reflectance$SAVI = SAVI
NBA_reflectance$NDMI = NDMI
NBA_reflectance$NBR  = NBR
NBA_reflectance$NBR2 = NBR2

## Export data.frame
write.table(BA_reflectance, "H:/machine_learning/BA_data.txt", sep="\t")
write.table(NBA_reflectance, "H:/machine_learning/NBA_data.txt", sep="\t")
