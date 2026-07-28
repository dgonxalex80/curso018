# Paleta principal
c00 <- "#C7433A"
c01 <- "#F05A4A"
c02 <- "#F4B43C"
c03 <- "#21B5E4"
c04 <- "#7A6DB2"
c05 <- "#79C45A"

# Colores de contraste (70% hacia blanco)
c00_70 <- "#EDC9C5"
c01_70 <- "#F9CECA"
c02_70 <- "#FBE8C5"
c03_70 <- "#C6EBF8"
c04_70 <- "#D7D2E8"
c05_70 <- "#D7EDCE"

library(colorspace)
# Aclara un color un 70%
degradar70 <- function(color) {
  colorspace::lighten(color, amount = 0.70)
}

degradar70("#21B5E4")