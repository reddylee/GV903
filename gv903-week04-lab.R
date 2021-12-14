########## Functions, conditions, loops ##########

# functions
write.my.name # does not exist yet
write.my.name <- function() {
  cat("Reddy Lee\n")
}
write.my.name
write.my.name()

hours.to.seconds <- function(hours) { # argument
  result <- hours * 60 * 60
  return(result) # return statement
} # explain correct indentation
hours.to.seconds
hours.to.seconds() # argument missing
hours.to.seconds(5)
hours.to.seconds(0.1)

hours.to.seconds <- function(hours = 8) { # default values
  result <- hours * 60 * 60
  return(result)
}
hours.to.seconds(5)
hours.to.seconds()

product <- function(a, b) { # several arguments
  return(a * b)
}
test <- product(3, 4)
test

# conditions
if (4 + 4 == 8) {
  cat("correct\n")
}

if (4 + 5 == 8) {
  cat("correct\n")
}

if (4 + 5 == 8) {
  cat("correct\n")
} else {
  cat("incorrect\n")
}

is.even <- function(x) {
  if (x %% 2 == 0) {# x %% 2 means if x/2 has remainder.
    return(TRUE)
  } else {
    return(FALSE)
  }
}
is.even(5)
is.even(8)

cat.class <- function(x) {
  if (is.matrix(x)) {
    cat("The object is a matrix.\n")
  } else if (is.character(x)) {
    cat("The object is a character object.\n")
  } else {
    cat(paste("The object is a", class(x), "object.\n"))
  }
}
cat.class("Essex")
mat <- matrix(1:16, ncol = 4)
cat.class(mat)
cat.class(256)

# for and while loops
for (i in 1:10) { # simple example
  print(i)
}

squares <- numeric(0) # common usage: access index of some object
for (i in 1:20) {
  squares[i] <- i^2
}
squares

for (number in c(15, 13, 12, 9, 3)) { # custom loop definition
  print(number + 5)
}

roots <- numeric(0) # basic 'while' example; aggregate square roots into vector
count <- 1
while (count <= 100) {
  roots[count] <- sqrt(count)
  count <- count + 1
}
roots

countdown <- 100 # another basic while example: countdown
while (countdown >= 0) {
  cat(paste("Current number:", countdown, "\n"))
  countdown <- countdown - 1
}

# Exercise from Video 2: write a function return the trace of matrix, use for-loops
trace2 <- function(m){
  if (nrow(m)!=ncol(m)){stop("Matrix is not square!")}
  tr <- 0
  for (i in 1:nrow(m)){
    for (j in 1: ncol(m)){
      if (i==j){
        tr <- tr+m[i,j]
      }
    }
  }
  return(tr)
}
trace2(mat)
trace2(matrix(1:36,ncol=6))
trace2(matrix(1:35,ncol=5))

#Exercise from Video 3: Possion Distribution
x <- 1:60
y <- dpois(x,35)
plot(x,y,pch=16,xlab="Count",ylab="Probability")
abline(v=qpois(0.05,35))
abline(v=24,col="red")
ppois(24,35)# p-value
sum(sapply(0:24,function(y){(35^y*exp(-35))/factorial(y)}))# p-value with manual calcualtion

# Exercise from Video 3: Two-Sided t-test 
t.test2 <- function(x,alpha=0.05){
  m <- mean(x)
  se <- sd(x)/sqrt(length(x))
  t <- m/se
  cval <- qt(1-(alpha/2),df=length(x)-1)
  pval <- 2*(1-abs(pt(t,df=length(x)-1)))
  cat("|t|>c:",abs(t),">",cval,",p=",
      pval,".\nEstimate:",m,"[",m-cval*se,
      ";",m+cval*se,"].",sep="")
}
t.test2(c(2,3,3,2,1,-2,1))

#Exercise from Video 3: Donation
v <- c(140,190,23,5,98,55,300,221)
m <- sum(v)/length(v)
l <- length(v)
s <- numeric(l)
for (i in 1:l){
  s[i] <- (v[i]-m)^2
}
s <- sqrt(sum(s)/(l-1))
s
tval <- (m-114)/(s/sqrt(8))
tval
cval <- qt(0.95,l-1)
cval
1-pnorm(tval)# p-value using the standard normal distribution
1-pt(tval,l-1)# p-value using the t distribution
m-(cval*(s/sqrt(8)))
m+(cval*(s/sqrt(8)))
t.test(v-114,alternative = "greater")

#Exercise week 4
#Exercise 1
week4 <- read_excel("week4.xlsx")
t.test(week4$VerbalScore-mean(week4$TeachScore),alternative="greater")



# EXERCISE: Reverse matrices using a function
week4_rev_row <- week4[rev(1:nrow(week4)),]# Write a function which returns a matrix in row-reverse or column-reverse
week4_rev_col <- week4[,rev(names(week4))]# order, as defined by the user.

# EXERCISE: Leap year algorithm
# Write an algorithm which can determine whether a given year is a leap year.
# Leap years are divisible by four. There is one exception: years which are
# divisible by 100 but not by 400 are no leap years. Are the following years
# leap years? 1932, 1838, 1900, 2000. Hint: The modulo operator %% determines
# remaining values after division, for example 14 %% 4 returns 2.
leap_year <- function(year){
  if (year %% 4 ==0){"This is a leap year!"}
  else {"This is not a leap year!"}
}

# EXERCISE: Fibonacci sequence
# Use a loop to compute the first 50 Fibonacci numbers. That is, each number
# in the sequence is the sum of the two previous numbers. Plot the sequence as
# a line/curve.
Fibonacci2 <- function(n){
  fib <- numeric(n+1)
  for (i in 0:n){
    if (i<=1){
      fib[i+1] <- i
    }else{
        fib[i+1] <- fib[i]+fib[i-1]
      }
  }
  return(fib)#to return only the nth term->fib(n+1)
}
lines(Fibonacci2(9))

# vectorization
my.matrix <- matrix(1:80, ncol = 8)
my.matrix
apply(my.matrix, 1, mean) # runs through matrix; mean of the rows
apply(my.matrix, 2, sum) # sum of the columns
apply(my.matrix, 1:2, function(x) {x^2}) # square of each element

my.matrix
exponent <- function(x, y) {
  mean(x)^y
}
apply(my.matrix, 1, exponent, y = 1)
apply(my.matrix, 1, exponent, y = 2)

my.vector <- 1:50
my.vector
lapply(my.vector, function(x) {(x + 2)^2}) # runs through vector; returns list
sapply(my.vector, function(x) {(x + 2)^2}) # runs through vector; returns vector

my.list <- as.list(my.vector)
my.list
sapply(my.list, function(x) {(x + 2)^2}) # lapply and sapply can also use lists

u <- url("http://www.eeso.ges.kyoto-u.ac.jp/emm/wp-content/uploads/2010/08/d01.csv")#import data online
data <- read.csv(u)
tapply(data$price, data$modelyear, mean) # apply function to vector by group
price.means <- tapply(data$price, data$modelyear, mean)
plot(names(price.means), price.means, type = "b", xlab = "Year",
     ylab = "Mean price",las=1)

# EXERCISE: Vectorization
# Recursion means that a function contains a call to itself. Use vectorization
# (that is, the apply family of commands) in combination with recursion to
# compute the first 20 Fibonacci numbers. You need to write a recursive
# function and apply it to a list of numbers.
mean.fib <- function(n){
  a <- Fibonacci2(n)
  mean(a)
}
mean.fib(19)


# EXERCISE: Density diagram
# Create a function that takes a variable and writes a diagram to your
# hard disk. The diagram should contain a histogram and a density curve. The
# density curve should be adjustable using an argument.
den.dia <- function(Mean,Sd){
  x <- rnorm(40,mean=Mean,sd=Sd)
    hist(x,freq = F,ylim=c(0,0.005),las=1)
  lines(density(x))
}
den.dia(1000,200)
