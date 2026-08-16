# colores.R
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

# Vectores reutilizables en gráficos base, ggplot2 y visualizaciones interactivas
paleta <- c(rojo = c00, coral = c01, amarillo = c02,
            cian = c03, violeta = c04, verde = c05)
paleta_70 <- c(rojo = c00_70, coral = c01_70, amarillo = c02_70,
               cian = c03_70, violeta = c04_70, verde = c05_70)

# Paleta secuencial azul para gráficos y visualizaciones.
paleta_azul <- c(azul_900 = "#163A5F", azul_700 = "#245B89",
                  azul_600 = "#2C78A8", azul_500 = "#3B9AC4",
                  azul_300 = "#73B8D4", azul_100 = "#B8DDEB")

c06 <- "#2C5697" # azul institucional
c07 <- "#F7F7F7" # fondo gris claro web
c6 <- c06 # alias para materiales anteriores
c7 <- c07
c0 <- paleta_azul[[1]]
c1 <- paleta_azul[[2]]
c2 <- paleta_azul[[3]]
c3 <- paleta_azul[[4]]
c4 <- paleta_azul[[5]]
c5 <- paleta_azul[[6]]

# Compatibilidad con materiales anteriores; los alias gráficos usan paleta_azul.
c10 <- c11 <- paleta_azul[[1]]
c12 <- c13 <- paleta_azul[[6]]
c20 <- c21 <- paleta_azul[[2]]
c22 <- c23 <- paleta_azul[[6]]
c30 <- c31 <- paleta_azul[[3]]
c32 <- paleta_azul[[6]]
c40 <- c41 <- paleta_azul[[4]]
c42 <- paleta_azul[[6]]
c50 <- c51 <- paleta_azul[[5]]
c52 <- paleta_azul[[6]]
c60 <- c61 <- paleta_azul[[6]]
c62 <- paleta_azul[[6]]
c70 <- c71 <- c06
c72 <- c07
c80 <- c06
c90 <- c07

# Paleta principal de siete colores usada por materiales heredados.
paleta1 <- c(c11, c21, c31, c41, c51, c61, c71)

paleta4 <- c(c0,c1,c2,c3)
