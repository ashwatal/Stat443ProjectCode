library(tidyverse)
library(ggplot2)
setwd("~/Fall 2024/STAT443/ConsultingProject")
data <- read.csv("TurbineGroup8.csv")
hist(data$CO, breaks = 50)

colnames(data)
mod <- lm(CO ~ AT + AP + AH + AFDP + GTEP + TIT + TAT+ TEY + CDP, data = data)
summary(mod)
plot(data$CO, mod$fitted.values)


Case1Data <- data %>% filter(TEY > 130 & TEY < 136)
mod2 <- lm(CO ~ AT + AP + AH + AFDP + GTEP + TIT + TAT+ TEY + CDP, data = Case1Data)
summary(mod2)
plot(Case1Data$CO, mod2$fitted.values)

Case2Data <- data %>% filter(TEY > 160)
mod3 <- lm(CO ~ AT + AP + AH + AFDP + GTEP + TIT + TAT+ TEY + CDP, data = Case2Data)
summary(mod3)
plot(Case2Data$CO, mod3$fitted.values)