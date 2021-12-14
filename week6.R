#Week 6: The Linear Regression Model-Model Specification,Interpretation, and Large-Sample Properties
#1. Prediction and Uncertainty
u <- paste0("https://stats.idre.ucla.edu/wp-content/",
            "uploads/2019/03/exercise.csv")
toy <- read.csv(u)
attach(toy)
head(toy)
outcome6 <- lm(loss~hours+effort)
library(texreg)
screenreg(outcome6,single.row = T)
loss_hat <- fitted(outcome6)
data.frame(head(fitted(outcome6)))#fitted use original data
data.frame(head(predict(outcome6)))#predict use new data
predict(outcome6,newdata=data.frame(hours=3.5,effort=27))

#method 1 to simulate predicted values
hours <- seq(0,4,0.1)
loss <- numeric(length(hours))
coefs <- coef(outcome6)
for (i in 1:length(hours)){
  loss[i] <- coefs[1]+coefs[2]*hours[i]+coefs[3]*mean(toy$effort)
}
plot(loss,hours)
coef(outcome6)

#method 2 to simulate predicted values
est <- numeric(length(hours))
se <- numeric(length(hours))
for (i in 1:length(hours)) {
  toy2 <- toy
  toy2$hours <- toy2$hours - hours[i]
  toy2$effort <- toy2$effort - mean(toy2$effort)
  outcome6_2 <- lm(loss ~ hours + effort, data = toy2)
  est[i] <- summary(outcome6_2)$coefficients[1, 1]
  se[i] <- summary(outcome6_2)$coefficients[1, 2]
}
plot(hours, est)

#Adding Intervals in R { Manually
plot(hours, est, ylim = c(-20, 50))
cval <- qt(1 - (0.05 / 2), nrow(outcome6_2) - length(coef(outcome6)))
lines(hours, est + cval * se)
lines(hours, est - cval * se)
se_resid <- sqrt(sum((predict(outcome6) - toy$loss)^2)
                 / (nrow(toy) - length(coef(outcome6))))
lines(hours, est + cval * sqrt(se^2 + se_resid^2))
lines(hours, est - cval * sqrt(se^2 + se_resid^2))

#Adding Intervals in R  predict Function
newdat <- data.frame(hours = hours, effort = mean(toy$effort))
pred <- predict(outcome6, newdata = newdat, interval = "confidence")
plot(hours, pred[, 1], ylim = c(-20, 50))
lines(hours, pred[, 2])
lines(hours, pred[, 3])
pred2 <- predict(outcome6, newdata = newdat, interval = "prediction")
lines(hours, pred2[, 2])
lines(hours, pred2[, 3])

#Other Methods for Generating Predictions with Uncertainty 
#Method 3: The Delta Method.
#Method 4: Simulation.
#Method 5: Bootstrapping.

# 2. Interaction Effects
#Multiplicative Interactions: Centering
model1 <- lm(loss ~ hours*effort + prog, data = toy)
toy$hrs <- toy$hours - mean(toy$hours)
toy$eff <- toy$effort - mean(toy$effort)
model2 <- lm(loss ~ hrs*eff + prog, data = toy)
screenreg(list(model1, model2), single.row = TRUE,
          custom.coef.names = c("cons", "hrs", "eff",
                                "prog", "hrs:eff", "hrs", "eff", "hrs:eff"))

library(interplot)
interplot(m = model2, var1 = "hrs", var2 = "eff") +
  xlab("Effort") + ylab("Hours")
interplot(m = model1, var1 = "hours",
          var2 = "effort") + xlab("Effort") + ylab("Hours")
interplot(m = model1, var1 = "effort",
          var2 = "hours") + xlab("Hours") + ylab("Effort")
