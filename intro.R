
## Más de 6000 paquetes disponibles
## - Algunos vienen instalados y se cargan al empezar:

  sessionInfo()

## Más de 6000 paquetes disponibles
## - Otros vienen instalados pero hay que cargarlos:

  library(lattice)
  packageVersion('lattice')

  packageDescription('lattice')

## Más de 6000 paquetes disponibles
## - Otros hay que instalarlos y después cargarlos:

  install.packages('data.table')
  library('data.table')
  packageDescription('data.table')

## Primeros pasos

x <- 1:5
x

length(x)

class(x)

## Generar vectores con =seq=

x1 <- seq(1, 100, by=2)
x1

seq(1, 100, length=10)

## Unir vectores con =c=

x <- c(1, 2, 3)
x

x <- seq(1, 100, length=10)
y <- seq(2, 100, length=50)
z <- c(x, y)
z

## Operaciones sencillas con vectores

  x <- 1:5
  x + 1

  x^2

  y <- 1:10
  x + y

  x * y

  x^2 + y^3

## Construir una matriz

  z <- 1:12
  M  <-  matrix(z, nrow=3)
  M

  class(M)

  dim(M)

  summary(M)

## Matrices a partir de vectores: =rbind= y =cbind=

z <- y <- x <- 1:10

M <- cbind(x, y, z)
M

M <- rbind(x, y, z)
M

## Para crear una lista usamos la función =list=

lista <- list(a=c(1,3,5),
              b=c('l', 'p', 'r', 's'),
              c=3)
lista

class(lista)

length(lista)

## Para crear un =data.frame=...

  df <- data.frame(x = 1:5,
                   y = rnorm(10),
                   z = 0)
  df

  length(df)

  dim(df)

## Para definir una función usamos la función =function=

myFun <- function(x, y) x + y
myFun

  class(myFun)

  myFun(3, 4)

## Podemos construir a partir de funciones

foo  <-  function(x, ...){
  mx <- mean(x, ...)
  medx <- median(x, ...)
  sdx <- sd(x, ...)
  c(mx, medx, sdx)
  }

## O en forma resumida:

foo <- function(x, ...){c(mean(x, ...), median(x, ...), sd(x, ...))}

## Y ahora usamos la función con vectores

foo(1:10)

foo(rnorm(1e5))

## Indexado numérico

  x <- seq(1, 100, 2)
  x

  x[1:5]

  x[10:5]

## Indexado con condiciones lógicas

  x == 37

  x[x == 37]

  x[x != 9]

  x[x > 20]

## Indexado con condiciones múltiples

z <- seq(-10, 10, by = .5)
z

z[z < -5 | z > 5]

cond <- (z >= 0 & z <= 5)
cond

z[cond]

## Indexado de matrices

M[1:2, ]

M[1:2, 2:3]

M[1, c(1, 4)]

## Indexado de matrices

M[-1,]

M[-c(1, 2),]

## Podemos acceder a los elementos...
## - Por su nombre

lista$a

## - o por su índice

  lista[1]

  lista[[1]]

## Podemos acceder a los elementos
## - Por su nombre (como una lista)

df$x

## - Por su índice (como una matriz)

df[1,]

df[,1]

## La función =apply=

apply(M, 1, sum)

rowSums(M)

apply(M, 2, mean)

colMeans(M)

## =lapply= y =sapply=

lista <- list(x = 1:10,
              y = seq(0, 10, 2),
              z = rnorm(30))
lapply(lista, sum)

sapply(lista, sum)

## =setwd=, =getwd=, =dir=

  getwd()
  old <- setwd("~/github/r-intro-eoi")
  dir()

  dir(pattern='.R')

  dir('data')

## Lectura de datos con =read.table=

  
  dats <- read.table('data/aranjuez.csv', sep=',', header=TRUE)
  head(dats)

## Lectura de datos con =read.table=

aranjuez <- read.csv('data/aranjuez.csv')
head(aranjuez)

  class(aranjuez)

  names(aranjuez)

## Indexado con =[]=
## - Filas

aranjuez[1:5,]

## - Filas y Columnas

aranjuez[10:14, 1:5]

## Indexado con =[]=
## - Condición basada en los datos

idx <- with(aranjuez, Radiation > 20 & TempAvg < 10) 

head(aranjuez[idx, ])

## =subset=

subset(aranjuez,
       subset = (Radiation > 20 & TempAvg < 10),
       select = c(Radiation, TempAvg,
           TempMax, TempMin))

## =aggregate=

aranjuez$rainy <- aranjuez$Rain > 0

aggregate(Radiation ~ rainy, data = aranjuez,
          FUN = mean)

## Variable categórica con =cut=

aranjuez$tempClass <- cut(aranjuez$TempAvg, 5)

aggregate(Radiation ~ tempClass, data = aranjuez,
          FUN = mean)

aggregate(Radiation ~ tempClass + rainy,
          data = aranjuez, FUN = mean)

## Fechas
## - =as.Date=

  aranjuez$date <- as.Date(aranjuez[,1],
                      format='%Y-%m-%d')

## - Funciones para extraer mes y año

  Year <- function(x)as.numeric(format(x, "%Y"))
  Month <- function(x)as.numeric(format(x, "%m"))

## - Añado columnas en =data.frame=

aranjuez$month <- Month(aranjuez$date)
aranjuez$year <- Year(aranjuez$date)
aranjuez$quarter <- quarters(aranjuez$date)

## Agregamos con fechas

aggregate(Radiation ~ year, data = aranjuez,
          FUN=mean)

aggregate(Radiation ~ month + year,
          data = aranjuez, FUN=mean)

## Agregamos varias variables con fechas

aggregate(cbind(Radiation, TempAvg) ~ month + year,
          data = aranjuez, FUN = mean)

## =lm=: Regresión simple

radTemp <- lm(Radiation ~ TempAvg, data = aranjuez)
summary(radTemp)

## =lm=: Regresión multiple

radTempHumid <- lm(Radiation ~ TempAvg * HumidAvg,
                   data = aranjuez)
summary(radTempHumid)

## =lm=: Regresión multiple

radTempRain <- lm(Radiation ~ TempAvg * rainy,
                  data = aranjuez)
summary(radTempRain)

## Lattice

## - Documentación: [[http://lmdvr.r-forge.r-project.org/figures/figures.html][Código y Figuras del libro]]

  library(lattice)

## =xyplot=

pdf(file="figs/xyplot.pdf")
  xyplot(Radiation ~ TempAvg, data=aranjuez)
dev.off()

## Paneles

pdf(file="figs/xyplotYear.pdf")
  xyplot(Radiation ~ TempAvg|factor(year),
         data=aranjuez)
dev.off()

## Grupos

pdf(file="figs/xyplotQuarter.pdf")
  xyplot(Radiation ~ TempAvg, groups=quarter,
         data=aranjuez, auto.key=list(space='right'))
dev.off()

## Matriz de gráficos de dispersión

png(filename="figs/splom.png")
  splom(aranjuez[,c("TempAvg", "HumidAvg", "WindAvg",
                    "Rain", "Radiation", "ET")],
        pscale=0, alpha=0.6, cex=0.3, pch=19)
dev.off()

## Box-and-Whiskers

pdf(file="figs/bwplot.pdf")
  bwplot(Radiation ~ month, data=aranjuez,
         horizontal=FALSE, pch='|')
dev.off()

## Histogramas

pdf(file="figs/histogram.pdf")
  histogram(~ Radiation|factor(year), data=aranjuez)
dev.off()

## Gráficos de densidad

pdf(file="figs/density.pdf")
densityplot(~ Radiation, groups=quarter,
            data=aranjuez,
            auto.key=list(space='right'))
dev.off()

## Añadimos regresión lineal

pdf(file="figs/xyplotPRG.pdf")
  xyplot(Radiation ~ TempAvg, data=aranjuez,
         type=c('p', 'r'), grid = TRUE,
         lwd=2, col.line='black')
  
dev.off()

## Añadimos ajuste local

pdf(file="figs/xyplotSmooth.pdf")
  xyplot(Radiation ~ TempAvg, data=aranjuez,
         type=c('p', 'smooth'), grid = TRUE,
         lwd=2, col.line='black')
dev.off()

## Colores y tamaños

pdf(file="figs/xyplotColors.pdf")
  xyplot(Radiation ~ TempAvg,
         type=c('p', 'r'),
         cex=2, col='blue',
         alpha=.5, pch=19,
         lwd=3, col.line='black',
         data=aranjuez)
dev.off()

## Colores con grupos: =par.settings= y =simpleTheme=
## - Primero definimos el tema con =simpleTheme=

  myTheme <- simpleTheme(col=c('red', 'blue',
                          'green', 'yellow'),
                          pch=19, alpha=.6)

## Colores con grupos: =par.settings= y =simpleTheme=
## - Aplicamos el resultado en =par.settings=

pdf(file="figs/myTheme.pdf")
  xyplot(Radiation ~ TempAvg,
         groups=quarter,
         par.settings=myTheme,
         auto.key=list(space='right'),
         data=aranjuez)
dev.off()

## Colores: brewer.pal

library(RColorBrewer)

myPal <- brewer.pal(n = 4, 'Dark2')

myTheme <- simpleTheme(col = myPal,
                       pch=19, alpha=.6)

## Asignamos paleta con =par.settings=

pdf(file="figs/brewer.pdf")
xyplot(Radiation ~ TempAvg,
       groups=quarter,
       par.settings=myTheme,
       auto.key=list(space='right'),
       data=aranjuez)
dev.off()
