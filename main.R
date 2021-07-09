# Title     : TODO
# Objective : TODO
# Created by: utilisateur
# Created on: 08/07/2021

library(readxl)
library(writexl)
library(dplyr)

print("---------------- START PEITEK STUDY -------------------")

# ---------------------------------------------------------------------------------
# -------------------   CALCULATE MEAN DATA FROM DATASET   ------------------------
# ---------------------------------------------------------------------------------

peitek_data <- read_excel("peitek-dataset.xlsx")
data <- data.frame(peitek_data)
data <- data[with(data, order(Snippet)), ]


print("---------------- FILTERED DATA -------------------")

filtered_data <- data %>% filter(Correct == 1)
filtered_data <- data.frame(Snippet = filtered_data$Snippet, ResponseTime = filtered_data$ResponseTime)

print(head(filtered_data, 10))

print("------------------ GROUPED DATA -------------------")

by_snippet <- filtered_data %>% group_by(Snippet)
by_snippet <- by_snippet %>% summarise(ResponseTime = mean(ResponseTime))
by_snippet <- by_snippet[!is.na(by_snippet$ResponseTime),]

print(by_snippet, 30)

# ---------------------------------------------------------------------------------
# -------------------   CALCULATE MEAN DATA FROM DATASET   ------------------------
# ---------------------------------------------------------------------------------

print("------------------ METRICS -------------------")

peitek_metrics <- read_excel("peitek-metrics.xlsx")
metrics <- data.frame(peitek_metrics)
metrics <- data.frame(Snippet = metrics$Snippet, SonarQube = metrics$SonarQube, GeneseCpx = metrics$GeneseCpx)

print(metrics)

print("------------------ MERGE -------------------")

merge <- data.frame(SonarQube = numeric(0), GeneseCpx = numeric(0), ResponseTime = numeric(0))
# merge <- data.frame(Snippet = character(0), SonarQube = numeric(0), GeneseCpx = numeric(0), ResponseTime = numeric(0))
for (row in 1:nrow(by_snippet)) {
  snippetName <- by_snippet[row,]$Snippet
  val <- metrics[which(metrics$Snippet == snippetName),]
  if (nrow(val) > 0) {
    # print(paste("SNIPPET", val$Snippet, val$SonarQube, val$GeneseCpx, is.numeric(val$SonarQube), is.numeric(val$GeneseCpx), is.numeric(by_snippet[row,]$ResponseTime)))
    newRow <- c(as.numeric(val$SonarQube), val$GeneseCpx, by_snippet[row,]$ResponseTime)
    # newRow <- c(val$Snippet, as.numeric(val$SonarQube), val$GeneseCpx, by_snippet[row,]$ResponseTime)
    merge[nrow(merge) + 1,] <- newRow
  }
}
print("------   MERGED ARRAY   -------")
print(merge)

write_xlsx(merge, "peitek-means.xlsx")

print("------------------ CORRELATION -------------------")

# Returns pearson's r for the given tau using Kendall's formula (1970)
convert_to_pearson <- function(tau) {
  return(sin(0.5 * pi * tau))
}

sonarqube_kendall <- cor(merge$SonarQube, merge$ResponseTime, method="kendall")
genese_cpx_kendall <- cor(merge$GeneseCpx, merge$ResponseTime, method="kendall")

sonarqube_pearson <- sapply(sonarqube_kendall, convert_to_pearson)
genese_cpx_pearson <- sapply(genese_cpx_kendall, convert_to_pearson)
print(paste("SONARQUBE : TAU KENDALL = ", sonarqube_kendall, " PEARSON = ", sonarqube_pearson))
print(paste("TAU KENDALL GENESE CPX : ", genese_cpx_kendall, " PEARSON = ", genese_cpx_pearson))



print("----------------- END PEITEK STUDY -------------------")
