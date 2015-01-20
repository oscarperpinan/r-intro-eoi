
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

x <- 1
x

length(x)

class(x)

x <- c(1, 2, 3)
x

## Operaciones sencillas con vectores

  x + 1

  y <- 1:10
  x + y

  x * y

  x^2

  x^2 + y^3

## ¿Y qué hago cuando necesito ayuda?

  exp(x)

  log(x)

help(exp)
help(log)

## Generar vectores con =seq=

x1 <- seq(1, 100, by=2)
x1

seq(1, 100, length=10)

## Unir vectores con =c=

x <- seq(1, 100, length=10)
y <- seq(2, 100, length=50)
z <- c(x, y)
z

z + c(1, 2)

z + c(1, 2, 3, 4, 5, 6, 7)

## Indexado numérico de vectores

  x <- seq(1, 100, 2)
  x[c(1, 2, 3, 4, 5)]

  x[1:5]

  x[10:5]

## Indexado de vectores con condiciones lógicas

  condicion <- (x>30)
  condicion

  class(condicion)

## Indexado de vectores con condiciones lógicas

  x == 37

  x[x == 37]

  x[x != 9]

  x[x > 20]

## Indexado de vectores con =%in%=

y <- seq(101, 200, 2)
y %in% c(101, 127, 141)

y[y %in% c(101, 127, 141)]

## Indexado de vectores con condiciones múltiples

z <- c(x, y)

z[z < 30 | z > 150]

z[z >= 30 & z <= 150]

## Indexado de vectores con condiciones múltiples

cond  <-  (x>10) & (x<50)
cond

cond  <-  (x>=10) & (x<=50)
cond

x[cond]

## Con las condiciones se pueden hacer operaciones

sum(cond)

!cond

sum(!cond)

as.numeric(cond)

## Funciones predefinidas

summary(x)
mean(x)
sd(x)
median(x)
max(x)
min(x)
range(x)
quantile(x)

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

## Transponer una matriz

t(M)

dim(t(M))

## Indexado de matrices

M[]

M[1, ]

M[, 1]

## Indexado de matrices

M[1:2, ]

M[1:2, 2:3]

M[1, c(1, 4)]

## Indexado de matrices

M[-1,]

M[-c(1, 2),]

## Operaciones con matrices

M * M

M ^ 2

M %*% M

M %*% t(M)

## Operaciones con matrices: funciones predefinidas

sum(M)

rowSums(M)

colSums(M)

rowMeans(M)

colMeans(M)

## La función =apply=

apply(M, 1, sum)

apply(M, 2, sum)

apply(M, 1, mean)

apply(M, 2, mean)

apply(M, 1, sd, na.rm=TRUE)

apply(M, 2, sd)

## Para crear una lista usamos la función =list=

  lista <- list(a=c(1,3,5),
                b=c('l', 'p', 'r', 's'),
                c=3)

## Podemos acceder a los elementos...
## - Por su nombre

lista

lista$a

lista$b

lista$c

## Podemos acceder a los elementos...
## - o por su índice

  lista[1]

  lista[[1]]

  
  class(lista[1])

  class(lista[[1]])

## Para matrices =apply=, para listas =lapply= y =sapply=

lista <- list(x = 1:10,
              y = seq(0, 10, 2),
              z = rnorm(30))
lapply(lista, sum)

sapply(lista, sum)

## Para crear un =data.frame=...

  df <- data.frame(x = 1:10,
                   y = rnorm(10),
                   z = 0)
  df

  length(df)

  dim(df)

## Podemos acceder a los elementos
## - Por su nombre

df$x

df$y

df$z

## - Por su índice

df[1,]

df[,1]

## La regla del reciclaje

  year <- 2011
  month <- 1:12
  class <- c('A', 'B', 'C')
  vals <- rnorm(12)
  
  dats <- data.frame(year, month, class, vals)
  dats

## La función =expand.grid=

  x <- y <- seq(-4*pi, 4*pi, len=200)
  df <- expand.grid(x = x, y = y)
  head(df)

  tail(df)

  summary(df)

## Para definir una función usamos la función =function=

  myFun <- function(x, y) x + y
  myFun(3, 4)

  class(myFun)

## Definir una función a partir de funciones

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

## Y también funciona con matrices

rowMeans(M)

apply(M, 1, foo)

## =setwd=, =getwd=, =dir=

  getwd()
  old <- setwd("~/github/r-intro-eoi")
  dir()

  dir(pattern='.R')

  dir('data')

## Lectura de datos con =read.table=

  dats <- read.table('data/aranjuez.csv')
  head(dats)

## Lectura de datos con =read.table=

  
  dats <- read.table('data/aranjuez.csv', sep=',')
  head(dats)

## Lectura de datos con =read.table=

  
  dats <- read.table('data/aranjuez.csv', sep=',', header=TRUE)
  head(dats)

## Lectura de datos con =read.table=

  
  aranjuez <- read.csv('data/aranjuez.csv')
  head(aranjuez)

  class(aranjuez)

  names(aranjuez)

## =aggregate=

aranjuez$rainy <- aranjuez$Rain > 0

aggregate(Radiation ~ rainy, data = aranjuez, FUN = mean)

## Variable categórica con =cut=

aranjuez$tempClass <- cut(aranjuez$TempAvg, 5)

aggregate(Radiation ~ tempClass, data = aranjuez, FUN = mean)
