## Calc spectral indexes in a Reflectance array
## Dhemerson Conciani (dh.conciani@gmail.com)
## Equations in (https://landsat.usgs.gov/sites/default/files/documents/si_product_guide.pdf)

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
