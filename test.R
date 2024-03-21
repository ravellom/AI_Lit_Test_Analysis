# Cargar las librerías necesarias
library(readxl)

# URL del archivo Excel
#url <- 
# "https://github.com/ravellom/
#AI_Lit_Test_Analysis/raw/main/correcto_217_0_9.xlsx"
url <- "correcto_0_11.xlsx"

### IMPORTANTE Los datos son dicotómicos [0,1]
### Han sido procesados en python con el siguinete código: 
#https://github.com/ravellom/AI_Lit_Test_Analysis

# Ruta temporal para guardar el archivo descargado
temp_file <- tempfile(fileext = ".xlsx")

# Descargar el archivo
download.file(url, temp_file, mode = "wb") 
# El 'mode = "wb"' es importante para archivos binarios como .xlsx

# Leer el archivo descargado
df <- read_xlsx(temp_file)
df <- read_xlsx("D:/ravello/My_APPs/AI_Lit_Test_Analysis/correcto_0_14.xlsx")

# Cuando ya no necesites el archivo, puedes eliminar el archivo temporal
unlink(temp_file)

# Aislar solo los items

data <- df[7:36]

head(data)

any(is.na(data))

sapply(data, table, useNA = "ifany")


data_score_rowsums <- rowSums(data)
hist(data_score_rowsums)

install.packages("psych")
library(psych)
alfa <- psych::alpha(data)
alfa

