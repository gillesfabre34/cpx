# Title     : TODO
# Objective : TODO
# Created by: utilisateur
# Created on: 08/07/2021

library(readxl)
library(writexl)
library(dplyr)

print("---------------- START STUDY -------------------")


xl_data <- read_excel("dataset-cpx.xlsx", sheet="data", range="E1:H24")
data <- data.frame(xl_data)
metrics <- data %>% select(2:(ncol(data)))

# Removes the rows with NAs
sanitize <- function(col, data) {
  columns <- data.frame("response_time" = data$response_time, data[col])
  return (columns[complete.cases(columns),])
}

# Calculates Kendall's tau and Pearson coefficient
analyze <- function(col, data) {
  kendall <- cor(data[col], c(data$response_time), method="kendall")
  pearson <- cor(data[col], c(data$response_time), method="pearson")
  print(paste(col, " : Kendall = ", kendall, " Pearson = ", pearson))
}


for (i in 1:ncol(metrics)) {
  metric_name <- names(metrics)[i]
  sanitized <- sanitize(metric_name, data)
  analyze(metric_name, sanitized)
}


print("----------------- END STUDY -------------------")
