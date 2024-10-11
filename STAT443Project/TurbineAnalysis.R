library(tidyverse)
library(ggplot2)
library(car)
setwd("~/Fall 2024/STAT443/ConsultingProject")
data <- read.csv("TurbineGroup8.csv")
hist(data$CO, breaks = 50)

colnames(data)

# Fit Models for each case
mod <- lm(CO ~ AT + AP + AH + AFDP + GTEP + TIT + TAT+ TEY + CDP, data = data)
summary(mod)
plot(data$CO, mod$fitted.values)

# Improve models for each case
mod <- lm(CO ~ AT + AP + AH + AFDP + GTEP + TIT + TAT+ TEY + CDP, data = data %>% filter(CO < 20))
summary(mod)

Case1Data <- data %>% filter(TEY > 130 & TEY < 136)
mod2 <- lm(CO ~ AT + AP + AH + AFDP + GTEP + TIT + TAT+ TEY + CDP, data = Case1Data)
summary(mod2)
plot(Case1Data$CO, mod2$fitted.values)

Case2Data <- data %>% filter(TEY > 160)
mod3 <- lm(CO ~ AT + AP + AH + AFDP + GTEP + TIT + TAT+ TEY + CDP, data = Case2Data)
summary(mod3)
plot(Case2Data$CO, mod3$fitted.values)


### Work on highest case data
hist(Case2Data$CO, breaks = 50)
#hist(Case2Data$CDP, breaks = 50)
# All var case
mod3 <- lm(CO ~ AT + AP + AH + AFDP + GTEP + TIT + TAT+ TEY + CDP, data = Case2Data)
summary(mod3)
plot(Case2Data$CO, mod3$fitted.values)
cor(Case2Data)
# Identify collinear variables
vif(mod3)

mod3 <- lm(CO ~ AT + AFDP + TIT + TAT + GTEP, data = Case2Data)
summary(mod3)
vif(mod3)

# Model that relates turbine energy yield to ambient variables
summary(lm(TEY ~ AT + AH + AFDP + TIT + TAT, data = Case2Data))



