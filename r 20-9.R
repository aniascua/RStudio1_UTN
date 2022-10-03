# cargamos el paquete tidyverse (incluye ggplot2)
library(tidyverse)

# buscamos la ruta del archivo de csv
file.choose()

# copiamos la ruta de la consola y la guardamos en una variable 
ruta_csv <- "C:\\Users\\anaas\\Desktop\\base de datos 50 registros - Hoja 1 (1).csv"

# importamos los datos
# yo le puse de nombre baseDeDatos con camelCase (la base de datos tiene 50 registros)
baseDeDatos <- read_csv(ruta_csv)

# miramos los datos con la función View (V mayúscula)
View(baseDeDatos)

# graficamos con GGplot2
ggplot(data = baseDeDatos, aes(x = EDAD)) + geom_bar()

# -------------------------
# X es un eje
# Y es otro eje

# seleccionamos variables
#db50$EDAD

# seleccionamos columnas dentro de nuestra base de datos
select(baseDeDatos,NOMBRE,EDAD) # seleccionamos la base de datos, y 2 columnas

# con 2 columnas de la base de datos, generamos un gráfico de barras (barplot):
barplot(baseDeDatos$EDAD, 
        col = "green",  main = "2 COLUMNAS SELECCIONADAS PARA BARPLOT",
        xlab = "Nombres", ylab = "Edades")


# probando algo
ggplot(data = baseDeDatos, aes(x = EDAD, fill = as.factor(EDAD))) +
  geom_bar() +
  xlab("Edades") +
  ylab("Nombres") +
  ggtitle("2 COLUMNAS SELECCIONADAS PARA BARPLOT - UTN") +
  labs(fill = "Edades") +
  theme_minimal()


# agregamos título y mejoramos características visuales
ggplot(data = baseDeDatos, aes(x = EDAD)) +
  geom_bar() +
  xlab("Edades") +
  ylab("Cantidades") + 
  ggtitle("Gráfico de barras - UTN FRSR 2022")
  

# agregamos COLORES

ggplot(data = baseDeDatos, aes(x = EDAD)) +
  geom_bar(color = 'grey69', fill = 'lawngreen') +
  xlab("Edades") +
  ylab("Cantidad") +
  ggtitle("ETAPA 1 - Gráfico de barras UTN FRSR '22 ")
  

# le asigno colores distintos a un grupo de datos (edades en este caso)
ggplot(data = baseDeDatos, aes(x = EDAD, fill = as.factor(EDAD))) +
  geom_bar() +
  xlab("Edades") +
  ylab("Nombres") +
  ggtitle("ETAPA 1 GRÁFICO DE BARRAS - UTN") +
  labs(fill = "Edades")



# ---------------------


# 1 seleccionando variables
#db50$EDAD

select(db50,ID,NOMBRE,EDAD)