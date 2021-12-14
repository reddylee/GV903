
########## DATA TYPES AND STRUCTURES ##########

# basic math operations and strings
1 + 4
test # this is a comment; instruct students to comment their code
1  +   4
1 + # code spread over multiple lines
  4
a <- 3 # define a=3
b <- 1 + 4 # define b=1+4
a + b # a+b
a + b == 8 # judge if a+b=8
a + b == 7 # judge if a+b=7
c <- a + b == 7
c
a * b
a / b
a - b
a^b # a to the power of b
sqrt(b) # square root of b
log(b) # natural log of b
class(b) # add 'numeric' and 'integer' to whiteboard
class(c) # add 'logical' to whiteboard

# character strings
c <- "abcd"
d <- "efg"
class(c) # add 'character' to whiteboard
paste(c, d)
paste(c, d, c, sep = ";")
e <- paste(c,d,c, "\n\n", "hello", "\n\n", sep="")
e
print(e) # same result
cat(e) # proper line breaks

# the workspace
getwd()
old.wd <- getwd()
setwd("/Users/reddy/desktop/") # use tab key to complete path
getwd()
setwd(old.wd)
getwd()
dir()
ls()
rm(b)
ls()
history() # press q key to quit history or help screens
help(ls)
?ls # same result

# vectors
c(1, 2, 3, 4, 5) # a simple vector
test1 <- c(1, 2, 3, 4, 5)
class(test1) # add 'vector' to whiteboard (second column)
test1
test2 <- c(3, 4, 5, 6, 7)
test3 <- 4
test1 + test2 # element-wise sum
test1 + test3 # 4 is used as a scalar
c(test1, test2, test3) # create a new vector 
test2[1] #access the first element of vector test2
test2[4] #access the fourth element of vector test2
str(test2) #structure of vector test2 
length(test2) # get the length of vector test2
3:7
seq(0.3, 0.96, 0.05) #0.05 is the interval from 0.3 to 0.9
rep(c(4, 7), 8) # repeat 4,7 with 8 times
rep(seq(0, 1, 0.5), 2)
new.variable <- numeric() # this is a little hard to understand
new.variable
data.entry(new.variable)
new.variable
rm(new.variable)

# factors
gender <- c(rep("male", 20), rep("female", 30))
class(gender)
gender
gender <- factor(gender)
class(gender)
gender
summary(gender)
str(gender)
char <- as.character(gender)# change elements to character
fac <- as.factor(char)# change elements to factor

# lists
mylist <- list(test1, test2, test3) # a simple list
class(mylist) # add 'list' to whiteboard (second column)
str(mylist)
mylist[[2]] # use double square brackets to access the second list
mylist[[2]][4] # fourth element of the second list item


########## 2D DATA TYPES ##########

# matrices
test1
matrix(test1)
matrix(c(test1, test2), ncol = 2)
matrix(c(test1, test2), nrow = 2,byrow = F)#byrow=T or F
matrix(c(test1, test3), ncol = 2) # test3 is a scalar
mat <- matrix(c(test1, test2), ncol = 2) # save it
mat
mat[3, ] # show third row
mat[, 2] # show second column
mat[3, 2] # show second element in the third row
mat[, ] # show all
class(mat) # add 'matrix' to the whiteboard (second column)
str(mat)
colnames(mat)
colnames(mat) <- c("column A", "column B")
colnames(mat)
rownames(mat) <- c("row A", "row B", "row C", "row D", "row E")
mat
mat[, 2]
str(mat)
sum(mat)
dim(mat)
cat(paste("Number of rows:", dim(mat)[1]))
rowSums(mat)
colSums(mat)
cbind(mat, mat)#bind by column (add column)
rbind(mat, mat)#bind by row (add row)
t(mat) # transpose
mat
mat + 10 # scalar addition
mat * 10 # scalar multiplication
mat + mat # matrix addition
mat * mat # Hadamard product
mat %*% t(mat) # matrix multiplication

# data frames
mat
dat <- as.data.frame(mat)
dat
dat == mat # values are all the same, but data type is not
class(dat) # add 'data frame' to whiteboard (second column)
class(mat)
str(dat)
dat$"column B"
dat$newcol <- c("a", "b", "c", "d", "e")
dat
dat$newcol#newcol does not need ""
str(dat)
newrow <- data.frame(10, 20, "f")
colnames(newrow) <- colnames(dat) # then use the same column names...
dat2 <- rbind(dat, newrow) # and finally collate them
str(dat2) # now the original data types were preserved!
dat2
row.names(dat2) <- 1:6
# EXERCISE: 
#Create a list containing one matrix and one data frame. The matrix
# should have 4 rows and 3 columns and contain the values from 1 to 12 in
# reverse order such that the first row contains the value 12, 11, 10, 9, the
# second starts with 8 and so on. The data frame should contain three rows and
# store information on the first name, height (in cm), and age of yourself and
# the two persons closest to you in the room. Finally, access the height of the
# second person and the number 6, respectively, using list indices (i.e., square
# brackets).
#Solution
list_a <- list(matrix(12:1,nrow=3,byrow=T),
               data.frame(names=c("Reddy","Peppa","George"),
                          height=c(172,150,110),
                          age=c(48,10,6)))
list_a
list_a[[2]]$height[2]#access the height of the second person
list_a[[1]][2,3] #access number 6

# EXERCISE:
#Task 1
v <- 1:5# Task 1: Create a 5 x 5 matrix where each column contains the square numbers
m <- matrix(c(v,v^2,(v^2)^2,((v^2)^2)^2,(((v^2)^2)^2)^2),ncol=5)#of the previous column. 
m#What is the largest value in the matrix?152587890625

#Task 2
colnames(m) <-c("one","two","three","four","five") # Task 2: Assign row and column names to the matrix.
rownames(m) <-c("一","二","三","四","五")
m
# Task 3
log(m[4,5]+m[5,5])#What is the logarithm of the sum of the two largest values?
#25.77877

# Task 4: 
a <- m[1:2,]#Rearrange the matrix such that the first two rows are used, then a new
b <- seq(50,10,-10)#row is inserted (say, values 50, 40, 30, 20, and 10), and then the
c <- m[5:4,]#last two rows of the original matrix are used in reverse order. The
new.m <- rbind(a,b,c)#resulting matrix has five rows: row 1, row 2, new row, row 5, row 4.
new.m

# Task 5
d <- as.data.frame(new.m)#Convert the matrix into a data frame. 
e <- cbind(d,c("a","b","c","d","e"))#Add a column with characters a to e, and label it "letters". 
str(e)
colnames(e)[dim(e)[2]] <- "letters"#?
e$letters[3]
str(e) # the column is a factor!
e$letters <- as.character(e$letters)
e$letters[3]#Access the c letter directly using an index.
