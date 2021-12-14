########## Plotting, summary statistics, IO, example ##########

test1 <- c(1, 2, 3, 4, 5)
test2 <- c(3, 4, 5, 6, 7)

# basic plotting
plot(1)
plot(1:10)
plot(rep(1, 10))#plot 1 ten times
test1
test2
plot(test1, test2)#test1 as x, test2 as y
plot(log(test1), test2)
plot(log(test1), test2, type = "b", lwd = 4, col = "red") # also try "b"
plot(log(test1), test2, type = "b", xlab = "Horizontal axis",
     ylab = "Vertical axis", main = "My plot",col="blue")
plot(log(test1), test2)
barplot(test2)
boxplot(test1, test2)

# the basic graphics package
example(plot)
example(barplot)
example(pie)
example(hist)
example(boxplot)
example(assocplot)
example(image)
example(contour)
example(persp)
example(dendrogram)
example(dotchart)
example(stars)
example(sunflowerplot)

# summary statistics
d2 <- log(9:1)
d3 <- seq(2, 5, 0.35)
min(d3)
max(d3)
range(d3)
mean(d3)
median(d3)
quantile(d3, 0.5)
quantile(d3, 0.75)
summary(d3)
sd(d3)
var(d3)
cor(d2, d3) # correlation
table(d3) # how often does each value exist?

# importing and exporting data
mat <- matrix(c(test1, test2), ncol = 2)
colnames(mat) <- c("column A", "column B")
rownames(mat) <- c("row A", "row B", "row C", "row D", "row E")
dat <- as.data.frame(mat)
dat$newcol <- c("a", "b", "c", "d", "e")
dat
write.table(dat, file = "file.csv", sep=";")#save data in current folder
dir() # file.csv is there; open it in a text editor or in RStudio
test <- read.table(file = "file.csv", sep = ";", header = TRUE)
test
rm(test)
write.csv(dat, file = "file.csv") # first cell empty; open in text editor again
test <- read.csv(file = "file.csv", row.names = 1)
test
rm(test)
write.csv2(dat, file = "file.csv")#not ",", but ";"
test <- read.csv2(file = "file.csv", row.names = 1)
test
rm(test)
save.image("mysession.RData") # save whole workspace
load("mysession.RData")

# Practice: Japanese used cars. Inspect the dataset, compute summary statistics
# of variables, plot variables and bivariate associations, use grouped box
# plots and histograms, convert nominal variables into factors, compute the
# correlations between variables. What interesting findings can you generate
# from the dataset with the knowledge you have?
u <- url("http://www.eeso.ges.kyoto-u.ac.jp/emm/wp-content/uploads/2010/08/d01.csv")#import data online
data <- read.csv(u)
data <- read.csv("d01.csv")
data
class(data)
str(data)
class(data$price)
as.character(data$color)
plot(data$price, data$run)
plot(data$modelyear, data$price)
plot(data$run, data$price)
cor(data$run, data$price)
cor.test(data$run, data$price)
cor.test(data$modelyear, data$price)
boxplot(data$price ~ data$modelyear)
boxplot(data$price ~ data$dealer)
summary(data)
summary(data$price)
min(data$price)
max(data$price)
mean(data$price)
median(data$price)
table(data$color)
table(data$color, data$area)
plot(table(data$color, data$area))
hist(data$run)
hist(data$price)

# EXERCISE: Play some more with the data and see what other interesting
# associations and descriptive results you can produce. Plot them. Use some of
# the visualisation and analysis functions covered earlier in this script.

# EXERCISE:
quantile(data$price,seq(0,1,1/3))# Task 1a: Open the Japanese used cars dataset. Recode the price variable into
data$newprice[data$price<=114] <- "small"#114,128,181          a new variable with three levels: small, medium, and large price.
data$newprice[data$price>114&data$price<=128] <- "medium"#          The three levels should have approximately equal numbers of
data$newprice[data$price>128] <- "large"#          observations. Cross-tabulate price and color. Which colors are
table(data$color,data$newprice)#          expensive, which ones are cheap? Hint: The Boolean "&" operator
#          combines two conditions (e.g., "1 + 2 == 3 & 1 + 3 == 3" returns
#          "FALSE").
# Task 1b: Is the resulting table different from a uniformly distributed table?
??"chi square"
#          Hint: Use the search function to find the chi square test.
# Task 1c: Create box plots of the construction year grouped by the three price
boxplot(data$modelyear~data$newprice,main="pricelevel&year")
#          levels. Add a title.
