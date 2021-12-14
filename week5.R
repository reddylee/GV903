#Week 5
install.packages("carData")#add dataset
library(carData)
head(Prestige)
attach(Prestige)
plot(education,income)
plot(education,log(income))
model <- lm(log(income)~education+women)
summary(model)

install.packages("texreg")
library(texreg)
texreg(model, dcolumn = TRUE, booktabs = TRUE, use.packages = FALSE,
       single.row = TRUE, table = TRUE)
texreg(model)
