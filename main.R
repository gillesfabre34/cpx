# Title     : TODO
# Objective : TODO
# Created by: utilisateur
# Created on: 08/07/2021

library(readxl)
library(writexl)
library(dplyr)

print("---------------- START STUDY -------------------")

# ---------------------------------------------------------------------------------
# -------------------   CALCULATE MEAN DATA FROM DATASET   ------------------------
# ---------------------------------------------------------------------------------

xl_data <- read_excel("dataset-cpx.xlsx", sheet="data", range="E1:H24")
data <- data.frame(xl_data)

# print(data)

sanitize <- function(col, data) {
  columns <- data.frame(data$response_time, data[col])
  return (columns[complete.cases(columns),])
}

analyze <- function(col, data) {

}

metrics <- data %>% select(2:4)

print("metrics")
print(metrics)
for (i in 2:(ncol(data))) {
  print(paste(" i = ", i))
  print(data[1, i])
}
print(sanitize("dynamic", data))


sonarqube_kendall <- cor(c(data$sonarqube), c(data$response_time), method="kendall")
genese_cpx_kendall <- cor(c(data$genese_cpx), c(data$response_time), method="kendall")
dynamic_kendall <- cor(c(data$dynamic), c(data$response_time), method="kendall")

sonarqube_pearson <- cor(c(data$sonarqube), c(data$response_time), method="pearson")
genese_cpx_pearson <- cor(c(data$genese_cpx), c(data$response_time), method="pearson")
dynamic_pearson <- cor(c(data$dynamic), c(data$response_time), method="pearson")


print(paste("SONARQUBE : TAU KENDALL = ", sonarqube_kendall, " PEARSON = ", sonarqube_pearson))
print(paste("GENESE CPX TAU KENDALL : ", genese_cpx_kendall, " PEARSON = ", genese_cpx_pearson))
print(paste("DYNAMIC TAU KENDALL : ", dynamic_kendall, " PEARSON = ", dynamic_pearson))


print("----------------- END STUDY -------------------")
#
# dynamic metric
#
# Time
#
# 68.01
# 100.27
# 154.64
# 211.48
# 70.51
# 66.05
# 104.83
# 65.42
# 42.59
# 65.47
# 59.81
# 37.43
# 48.39
# 20.50
# 99.99
# 145.24
# 80.62
# 89.94
# 54.50
#
#
#
# 5.25
# 11.9375
# 15.5
# 19.75
# 5.625
# 10
# 7
# 5.98828125
# 9
# 6
# 9
# 3
# 7.75
# 2
# 6
# 12.78125
# 7.5
# 6.875
# 7.75
