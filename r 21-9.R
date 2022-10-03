
# Objetivo: hacer graficas de barras en r
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. graficas de barras con base graphics
# 2. graficas de barras con ggplot2

# elegimos el archivo
file.choose()

# copiamos la ruta de la consola y la guardamos en una variable 
ruta_csv <- "C:\\Users\\anaas\\Desktop\\base de datos 50 registros - Hoja 1 (1).csv"

# importamos los datos
# yo le puse de nombre baseDeDatos con camelCase (la base de datos tiene 50 registros)
baseDeDatos2 <- read_csv(ruta_csv)

# cargando los datos
data(baseDeDatos2)

# viendo los datos
head(baseDeDatos2)

# generando tabla agrupada
table(baseDeDatos2$EDAD)

# grafica de barras basica
barplot(table(baseDeDatos2$EDAD))

# editando grafica de barras
barplot(table(baseDeDatos2$EDAD), 
col = 'lawngreen',
border = 'steelblue',
main = 'ETAPA 1 GRÁFICO DE BARRAS - UTN',
xlab = 'Edades',
ylab = 'Población')



# cargar ggplot2
# install.packages("ggplot2")
library(ggplot2)

# grafica de barras
ggplot(data = baseDeDatos2,
  mapping = aes(x = factor(EDAD))) +
geom_bar()
# coord_flip() esto es para ver barras horizontales

# guardando grafica en variable
p <- ggplot(data = baseDeDatos2,
       mapping = aes(x=as.factor(EDAD),
         fill = as.factor(NOMBRE))) 

# lo mismo de arriba pero como el profe
ggplot(data = baseDeDatos2,
       aes(x = EDAD, 
           fill = as.factor(EDAD)))

# stacked bar chart
p + geom_bar(position = 'stack',
              stat = 'count')

# dogde bar chart
p + geom_bar(position = 'dodge', stat = 'count')

# stacked + percent barchart
p + geom_bar(position = 'fill', stat = 'count')


# histograma
hist(baseDeDatos2$EDAD)

# editando el histograma con r basic
hist(baseDeDatos2$EDAD,
     # break = 50,
     col = 'steelblue',
     border = 'black',
     main = 'Histograma Edades Etapa 2',
     xlab = 'Edades',
     ylab = 'count')

library(ggplot2)
# editando el histograma con ggplot2 
# ggplot2 se ve más lindo
ggplot(data = baseDeDatos2,
       mapping = aes(x = EDAD)) +
  geom_histogram(bins = 9)

# separando por colores
ggplot(data = baseDeDatos2,
       mapping = aes(x = EDAD, 
      fill = factor(NOMBRE))) +
  geom_histogram(bins = 9,
      position = 'identity',
      alpha = 0.8)+
  labs(title = 'ETAPA 2 - HISTOGRAMA',
       fill = 'Nombres',
       x = 'Edades',
       y = 'Conteo',
       subtitle = 'UTN FRSR ESTADÍSTICA UTN',
       caption = 'fuente de los datos: Base de datos 50 registros')
)


# SCATTERPLOT
# library
install.packages("ggExtra")
library(ggplot2)
library(ggExtra)


# The mtcars dataset is proposed in R
head(baseDeDatos2)

# classic plot :
p <- ggplot(baseDeDatos2, aes(x=EDAD, y=NOMBRE, color=EDAD, size=EDAD)) +
  geom_point() +
  theme(legend.position="none")

p

# with marginal histogram
p <- ggMarginal(p, type="histogram", size=10)


# Custom marginal plots:
p <- ggMarginal(p, type="histogram", fill = "slateblue", xparams = list(  bins=10))

# Show only marginal plot for x axis
p3 <- ggMarginal(p, margins = 'x', color="purple", size=4)


# GEOM_POINT
ggplot(data = baseDeDatos2, mapping =
         aes(x = EDAD, y = NOMBRE))+
  geom_point(color = 'steelblue', fill = "blue",
             shape = 21,
             alpha = 0.5,
             size = 5,
             stroke = 2) +
  labs(title = 'ETAPA 1 - GRÁFICO DE PUNTOS',
       subtitle = 'UTN FRSR ESTADÍSTICA UTN',
       caption = 'fuente de los datos: Base de datos 50 registros')



# GRÁFICO LINEAL
library(ggplot2)

ggplot(data = baseDeDatos2, aes(x=NOMBRE,y=EDAD))+
  geom_bar(stat = "identity", fill="skyblue")+
  geom_line(color="black", stroke = 2) +
  geom_point(size=8, shape=22, fill="steelblue",
             color="blue")+
  labs(title = "ETAPA 1 - GRÁFICO LINEAL",
       subtitle = "UTN FRSR ESTADÍSTICA UTN",
       caption = "fuente de los datos: Base de datos 50 registros")+
  theme_minimal()


# PROBANDO A VER SI SALE EL DELINEADO NEGRO
ggplot(diamonds) +
  geom_histogram(bins = 50, aes(x = carat, fill = cut), color = 'black') +
  xlab("Carat") +
  ylab("Frecuencia") +
  ggtitle("Distribución de la variable Carat") +
  theme_minimal()



# ETAPA 1 PUNTO 7 CON TIDIVERSE LIBRARY
library("tidyverse")

# calculamos la media de la variable EDAD de nuestra base de datos con la función mean
mean(baseDeDatos2$EDAD)

# luego calculamos la mediana con la función median
median(baseDeDatos2$EDAD)

# también calculamos la varianza con la función var
var(baseDeDatos2$EDAD)

# y finalmente calculamos la desviación estándar con la función sd
sd(baseDeDatos2$EDAD)


# instalación de librerías
# tidyr
# readxl
# ggplot2
# dplyr
install.packages("tidyr")
install.packages("readxl")
install.packages("ggplot2")
install.packages("dplyr")


library(ggplot2)
library(tidyverse)
# histograma siguiendo el PDF de Estadística ggplot2
ggplot(baseDeDatos2) +
  geom_histogram(binwidth = 1,
      aes(x=EDAD),
      fill= 'steelblue')+
  xlab("EDADES")+
  ylab("count")+
  ggtitle("Histograma - Distribuición de la variable edad")+
  labs(title = "ETAPA 2 - HISTOGRAMA TIPO CARAT",
       subtitle = "UTN FRSR ESTADÍSTICA UTN",
       caption = "fuente de los datos: Base de datos 50 registros")+
  theme_minimal()


# barplot en escala de grises
ggplot(data = baseDeDatos2, aes(x=EDAD))+
  geom_bar()+
  labs(title = "ETAPA 2 - BARPLOT EN GRIS",
       subtitle = "UTN FRSR ESTADÍSTICA UTN",
       caption = "fuente de los datos: Base de datos 50 registros")


# barplot con color
ggplot(data = baseDeDatos2, aes(x=EDAD))+
  geom_bar(color = 'darkslategray', fill = 'steelblue')+
  ggtitle("ETAPA 2 - BARPLOT EN COLOR")


# barplot con orientaciones cambiadas
ggplot(data = baseDeDatos2, aes(x=EDAD))+
  geom_bar(color = 'darkslategray', fill = 'steelblue')+
  ggtitle("ETAPA 2 - BARPLOT CON ORIENTACIONES CAMBIADAS", 
          subtitle = "para cambiar la orientación utilizamos la función coord_flip()")+
  coord_flip()


# barplot con colores distintos para cada variable 
ggplot(data = baseDeDatos2, aes(x=EDAD, fill = as.factor(EDAD)))+
  geom_bar() +
  xlab("Edades")+
  labs(fill="EDAD")+
  ggtitle("ETAPA 2 - BARPLOT CON COLORES EN VARIABLES", 
          subtitle = "le agregamos colores distintos a las variables")


# barplot con colores distintos para cada variable
ggplot(data = baseDeDatos2, aes(x = ALTURA, fill = as.factor(ALTURA))) +
  geom_bar() +
  xlab("ALTURA") +
  ylab("count") +
  labs(fill = "ALTURA EN CM DE ALUMNOS", 
       title = "ETAPA 2 - BARPLOT CON COLORES DISTINTOS PARA CADA VARIABLE ALTURA (cm)",
       subtitle = "UTN FRSR ESTADÍSTICA UTN",
       caption = "fuente de los datos: Base de datos 50 registros")+
  coord_flip()
   

# siguiendo al pdf para dar color a variables
ggplot(data = baseDeDatos2,
       aes(x = EDAD,
           fill= as.factor(EDAD)))+
  geom_bar() +
  xlab("Edades")+
  ylab("count")+
  ggtitle("Gráfico de barras")+
  labs(fill="EDAD")


# histograma tipo CARAT en la variable ALTURA de nuestra database
ggplot(baseDeDatos2) +
  geom_histogram(bins = 50, aes(x = ALTURA, fill = as.factor(ALTURA), color = 'black')) 
+ xlab("Altura") +
  ylab("Frecuencia con la que se ven los datos") +
  ggtitle("Histograma tipo CARAT con la variable altura")+
  labs(fill="ALTURA (cm)", subtitle = "UTN FRSR ESTADÍSTICA UTN",
       caption = "fuente de los datos: Base de datos 50 registros")
+ theme_minimal()


# histograma de las variables Altura y Peso con cortes CUT
ggplot(baseDeDatos2) +
  geom_histogram(bins = 50, aes(x = PESO, fill = as.factor(ALTURA))) +
  facet_grid(ALTURA~., scales = 'free')+
  xlab("Peso (Kg)") +
  ylab("Frecuencia") +
  ggtitle("Histograma de las variables Peso y Altura con cortes Cut", 
          subtitle = "UTN FRSR ESTADÍSTICA")+
  labs(fill="Altura (cm)")+ theme_minimal()



# rango de 0 a 2 en histograma
ggplot(baseDeDatos2) +
  geom_histogram(bins = 10, binwidth = 0.8, aes(x = EDAD), fill = 'steelblue') +
  xlab("Edad") +
  ylab("Frecuencia") +
  ggtitle("Distribución de la variable EDAD", 
          subtitle = "intentando que cada columna tenga un rango de 0 a 2") +
  theme_minimal()+ coord_flip()



# histogram with CUT
ggplot(baseDeDatos2) +
  geom_histogram(bins = 30, aes(x = EDAD, fill = cut)) +
  xlab("Edad") +
  ylab("Frecuencia") +
  ggtitle("Distribución de la variable EDAD")+
  theme_minimal()


ggplot(data = baseDeDatos2, mapping =
         aes(x = EDAD))+
  geom_histogram(bins=50, fill = cut)




# example of the code histogram with CUT (this one works)
ggplot(diamonds) +
  geom_histogram(bins = 50, aes(x = carat, fill = cut)) +
  xlab("Carat") +
  ylab("Frecuencia") +
  ggtitle("Distribución de la variable Carat") +
  theme_minimal()


# el mio SIN color
ggplot(equiposUTNFRSR) +
  geom_histogram(bins = 50, aes(x = EDAD, fill = ALTURA)) +
  xlab("EDAD") +
  ylab("Frecuencia") +
  ggtitle("Distribución de la variable EDAD") +
  theme_minimal()

# discrete categories
equiposUTNFRSR %>% 
  mutate(altura_bin = 
           case_when(ALTURA < 150 ~ "< 150",
                                ALTURA >= 150 & ALTURA < 160 ~ "150-159",
                                ALTURA >= 160 & ALTURA < 170 ~ "160-169",
                                ALTURA >= 170 ~ ">= 170"),
         altura_bin = factor(altura_bin, levels = c("< 150", "150-159", "160-169", 
                                                    ">= 170"))) %>% 
  ggplot(aes(x = EDAD, fill = altura_bin)) +
  geom_histogram() +
  labs(x = "EDAD",
       y = "Frecuencia",
       title = "Distribución de la variable EDAD", fill = "ALTURA (cm)") +
  theme_minimal()



# Grafico de puntos y líneas
library(ggplot2)
ggplot(data = baseDeDatos2, 
       aes(PESO,EDAD))+
  geom_point(aes(color=EDAD, PESO),
             size=2,alpha=0.7)+
  xlab("Peso en Kg")+
  ylab("Peso en Kg")+
  ggtitle("relacion entre gusto de
          la audiencia y la critica")+
  theme_minimal()



# GRÁFICO DE DISPERSIÓN Y PUNTOS
ggplot(data = baseDeDatos2, aes(x = PESO, y = ALTURA)) +
  geom_point(aes(color = NOMBRE), size = 5, alpha = 0.8) +
  xlab('Peso en Kg') +
  ylab('Altura en CM') +
  ggtitle('Relación entre peso y edad de las personas',
          subtitle = "UTN FRSR ESTADÍSTICA") +
  labs(caption = "fuente de los datos: Base de datos 50 registros")+
  theme_minimal()


# GRÁFICO DE CAJAS BOXPLOT Y VIOLÍN
library("ggplot")
ggplot(data = baseDeDatos2, 
       aes(PESO,ALTURA))+
  geom_point(aes(color = PESO,fill = as.factor(PESO)),
size=5,alpha=1)+
  xlab('PESO (Kg)')+
  ylab('ALTURA (cm)')+
  ggtitle('GRÁFICO DE CAJAS BOXPLOT Y VIOLÍN',
          subtitle = "UTN FRSR ESTADÍSTICA") +
  labs(caption = "fuente de los datos: Base de datos 50 registros")+
  theme_minimal()+
  labs(fill="PESO (Kg)")





# experimentando con R y equipos UTNFRSR
file.choose()

# copiamos la ruta de la consola y la guardamos en una variable 
ruta_csv <- "C:\\Users\\anaas\\Documents\\Estadistica y R\\estadistica\\base de datos 50 registros - Hoja 1 (1).csv"

# importamos los datos
# yo le puse de nombre baseDeDatos con camelCase (la base de datos tiene 50 registros)
equiposUTNFRSR <- read_csv(ruta_csv)

# cargando los datos
data(equiposUTNFRSR)

# viendo los datos
head(equiposUTNFRSR)

View(equiposUTNFRSR)

# generando tabla agrupada
table(equiposUTNFRSR$...5)


ggplot(data = equiposUTNFRSR, aes(x=...4, fill = as.factor(...5)))+
  geom_bar() +
  xlab("ejeX")+
  ggtitle("Probando cositas", 
          subtitle = "le agregamos colores distintos a las variables")+
  theme_minimal()


# dispersión PROBANDO R FORUM 27-9
ggplot(data = equiposUTNFRSR, aes(...4,...5)) +
  geom_point(aes(color = ...5), size = 4, alpha = 0.9, show.legend = F) +
  xlab('Localidad') +
  ylab('Provincia') +
  ggtitle('Inscriptos en la Tecnicatura Universitaria en Programación, prueba 1',
          subtitle = "UTN FRSR ESTADÍSTICA") +
  labs(caption = "bit.ly/3dMZyFf - fuente: Equipos UTN San Rafael 2do cuatrimestre 2022")+
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45, hjust = 0.95, vjust=0.95, size = 6.5))

# prueba 1
ggplot(data = equiposUTNFRSR) +
  geom_bar(aes(x = factor(...4), fill = factor(...5)), position = "fill")
#aes(x = carat, fill = cut), color = 'black') 


# prueba 2
ggplot(data = equiposUTNFRSR, 
       aes(x=...5, fill = as.factor(...5)))+
  geom_bar()+
  xlab("Provincias")+
  ylab("cantidad de veces que se repite")+
  ggtitle("Inscriptos en la Tecnicatura, prueba 2")+
  labs(fill = "Columna 4")+theme_minimal()+
  theme(axis.text.x = element_text(angle = 30, hjust = 1, vjust=1, size = 10))


# word cloud
install.packages("ggwordcloud")
library(ggwordcloud)

# Datos
df <- equiposUTNFRSR

set.seed(1)
ggplot(df, aes(label = ...5)) +
  geom_text_wordcloud() +
  theme_minimal()


# dispersion 2
ggplot(data = equiposUTNFRSR, aes(...4,...5)) +
  geom_point(aes(color = ...5), size = 5, alpha = 0.5) +
  xlab('ejeX') +
  ylab('ejeY') +
  ggtitle('Estoy probando',
          subtitle = "UTN FRSR ESTADÍSTICA") +
  labs(caption = "fuente de los datos: Base de datos UTN estudiantes")+
  theme_minimal()

View(equiposUTNFRSR)

# GRÁFICO DE CAJAS BOXPLOT Y VIOLÍN
#library("ggplot")
ggplot(data = equiposUTNFRSR, 
       aes(...4,...5))+
  geom_point(aes(color = ...5,fill = as.factor(...5)),
             size=5,alpha=1)+
  xlab('ejex')+
  ylab('ejeY')+
  ggtitle('GRÁFICO DE CAJAS BOXPLOT Y VIOLÍN',
          subtitle = "UTN FRSR ESTADÍSTICA") +
  labs(caption = "fuente de los datos: Base de datos alumnos UTN")+
  theme_minimal()+
  labs(fill="...5")+
  theme(axis.text.x = element_text(angle = 45, hjust = 0.95, vjust=0.95))+
  show.legend = F

install.packages("viridis")
library(viridis)

rename(equiposUTNFRSR, State = ...4) 
rename(equiposUTNFRSR, Province = ...5, State = ...4, Group = 1, Lastname = ...2, Name = ...3)

head(equiposUTNFRSR)
install.packages("datapasta")

dput(head(equiposUTNFRSR, 5))
# This is the sample data that you have to use in your reprex.
data.frame(
  Sepal.Length = c(5.1, 4.9, 4.7, 4.6, 5),
  Sepal.Width = c(3.5, 3, 3.2, 3.1, 3.6)
)

View(equiposUTNFRSR)

# probando sugerencia de R Forum
theme(axis.text.x = element_text(angle = 45, hjust = 0.95, vjust=0.95))




# probando algo con equipos UTN FRSR
# elegimos el archivo
file.choose()

# copiamos la ruta de la consola y la guardamos en una variable 
ruta_csv <-  "C:\\Users\\anaas\\Documents\\Estadística R proyectos escritorio\\Copia de Equipos UTN SanRafael - Hoja 1.csv"

# importamos los datos
# yo le puse de nombre baseDeDatos con camelCase (la base de datos tiene 50 registros)
equiposUTN <- read_csv(ruta_csv)

# visualizamos la tabla de datos
View(equiposUTN)

# codigo con el que vamos a probar:

# prueba 2
ggplot(data = equiposUTN, 
       aes(x=Provincia, fill = as.factor(Provincia)))+
  geom_bar()+
  xlab("Provincias")+
  ylab("cantidad de veces que se repite")+
  ggtitle("Inscriptos en la Tecnicatura, prueba 2")+
  labs(fill = "Columna 4")+theme_minimal()+
  theme(axis.text.x = element_text(angle = 30, hjust = 1, vjust=1, size = 10))


library(dplyr, warn.conflicts = FALSE)

equiposUTNfiltrado <- equiposUTN %>%
  group_by(Provincia, Localidad) %>% 
  filter(max(Provincia) > 100) %>%
  ungroup()

ggplot(equiposUTNfiltrado) +
  geom_line(aes(Provincia, Grupo, colour = Provincia))


ggplot(equiposUTN) +
  geom_line(aes(Provincia, Localidad, colour = Provincia)) +
  gghighlight(max(Provincia) > 100)+theme_minimal()


equiposUTN %>% 
  ggplot(mapping = aes(Provincia, Localidad)) +
  geom_col(fill = "grey") +
  geom_col(data = equiposUTN %>% filter(Provincia == "Mendoza"),
            fill = "orange")+
  theme(axis.text.x = element_text(angle = 30, hjust = 1, vjust=1, size = 10))+
  theme_minimal()



library(tidyverse)
library(gghighlight)

equiposUTN <- equiposUTN %>% mutate(Localidad = as.character(Localidad), 
                                    Provincia = as.character(Provincia))

ggplot(equiposUTN, aes(Provincia, Localidad, fill = Provincia))  +
  geom_col() + 
  gghighlight(Provincia == "Bs As") +
  facet_grid(~ Localidad) + theme_minimal()



library(tidyverse)
library(gghighlight)

equiposUTN %>%
  filter(Provincia > 50)

equiposUTN <- equiposUTN %>% mutate(Provincia = as.character(Provincia), Localidad = as.character(Localidad))
ggplot(equiposUTN, aes(Provincia, Localidad, fill = Provincia))  +
  geom_col()+ #no dodge
  gghighlight(Localidad == "Mendoza") + #only one variable
  facet_grid(~ Localidad)
   #the other variable is here
#> Warning: Tried to calculate with group_by(), but the calculation failed.
#> Falling back to ungrouped filter operation...







set.seed(2)
equiposUTN <- purrr::map_dfr(
  letters,
  ~ data.frame(
    Provincia = 1:400,
    Localidad = cumsum(runif(400, -1, 1)),
    type = .,
    flag = sample(c(TRUE, FALSE), size = 400, replace = TRUE),
    stringsAsFactors = FALSE
  )
)
library(ggplot2)

ggplot(equiposUTN) +
  geom_line(aes(Provincia, Localidad, colour = type))


library(dplyr, warn.conflicts = FALSE)

equiposUTN_filtrado <- equiposUTN %>%
  group_by(type) %>% 
  filter(max(Provincia) > 50) %>%
  ungroup()

ggplot(equiposUTN_filtrado) +
  geom_line(aes(Provincia, Localidad, colour = type))


library(gghighlight)

ggplot(equiposUTN_filtrado) +
  geom_line(aes(Provincia, Localidad, colour = type)) +
  gghighlight(max(Provincia) > 50) 



ggplot(equiposUTN_filtrado) +
  geom_line(aes(Provincia, Localidad, colour = type)) +
  gghighlight(max(Provincia) > 50, mean(flag) > 0.5)
#> label_key: type


ggplot(equiposUTN_filtrado) +
  geom_line(aes(Provincia, Localidad, colour = type)) +
  gghighlight(max(Provincia) > 50) +
  theme_minimal()
#> label_key: type


ggplot(equiposUTN_filtrado) +
  geom_line(aes(Provincia, Localidad, colour = type)) +
  gghighlight(max(Provincia) > 50) +
  theme_minimal() +
  facet_wrap(~ type)




p <- ggplot(equiposUTN_filtrado, aes(Provincia, fill = Localidad)) +
  geom_histogram() +
  gghighlight()+theme_minimal()

p


p + facet_wrap(~ Provincia)

p



library(tidyverse)
library(gghighlight)

mtcars2 <- mtcars %>% mutate(cyl = as.character(cyl), gear = as.character(gear))
ggplot(mtcars2, aes(cyl, disp, fill = gear))  +
  geom_col() +
  gghighlight(cyl == "4") + 
  facet_grid(~ gear)


  equiposUTN <- equiposUTN %>% mutate(Localidad = as.character(Localidad), 
                                    Provincia = as.character(Provincia))
ggplot(equiposUTN, aes(Provincia, Localidad, fill = Localidad))  +
  geom_col() +
  gghighlight(Provincia == "Mendoza") + 
  facet_grid(~ Provincia)+
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))
+
        theme(axis.text.y = element_blank())+theme_minimal()
+ scale_y_discrete(labels = NULL, breaks = NULL) + 
  labs(y = "")

equiposUTN %>%
  filter(Provincia > 50)


theme(axis.title.x=element_blank(),
      axis.text.x=element_blank(),
      axis.ticks.x=element_blank())
Share
Follow


# elegimos el archivo
file.choose()

# copiamos la ruta de la consola y la guardamos en una variable 
ruta_csv <- "C:\\Users\\anaas\\Desktop\\Copia de Equipos UTN SanRafael - Hoja 1.csv"

# importamos los datos
# yo le puse de nombre baseDeDatos con camelCase (la base de datos tiene 50 registros)
equiposUTN <- read_csv(ruta_csv)
