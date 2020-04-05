#################################
######    purrr Package    ######
#################################

### 2.1 - Map ###

# map() is the basic function in purrr package.  It transform the input by applying a function to each
# element and returning a vector the same length as the input. The operation is similar to lapply, but 
# map() is designed based on the pipe operation concept.

# e.g. Creating a list with 4 elements by using lapply return with the sums of each element
theList <- list(A=matrix(1:9, 3), B=1:5, C=matrix(1:4, 2), D=2)
theList
lapply(theList, sum)

# Now using map(), it can also generate the same result.
library(purrr)
theList %>% map(sum)

# Note: If one of the elements is missing (NA), we need to specify dropping the missing element from the calculation
# using na.rm=TRUE
theList2 <- theList
theList2[[1]][2,1] <- NA
theList2[[2]][4] <- NA

# The return list has two NA values because the elements were missing (NA) in the original list
theList2 %>% map(sum)

# We can pack anonymous function function(x) with na.rm=TRUE inside the map() function
theList2 %>% map(function(x) sum(x, na.rm=TRUE))

# An alternative is to pass in the na.rm=TRUE with sum within the map() function
theList2 %>% map(sum, na.rm=TRUE)


### 2.2 - Return Data Type from Map ###

# purrr package offers different data type to be returned from map() function
# map => list
# map_int => integer
# map_dbl => numeric
# map_chr => character
# map_lgl => logical
# map_df => data.frame
# Note: if the selected data type cannot be generated, it will return an error "map_*"
# Also each return element should has vector length = 1 (atomic vector).  
# Any return element with vector length > 1 will cause an error.

# e.g. suppose we are trying to get the count of row from each element in the list.
theList %>% map_int(NROW)
# from each element in the list, it will return the count of the rows

# If we use map_int() to get the mean of each element in the list, it will cause an error
# because mean will return a numeric, not an interger.
theList %>% map_int(mean)

# To correct it, we can use map_dbl to return a numeric value from mean
theList %>% map_dbl(mean)

# For returning character, use map_chr()
theList %>% map_chr(class)

# One problem is that what if an element contain multiple data type.
# Suppose we are adding a new element "E" to the list, which contains three ordered strings A, B, and C.
theList3 <- theList
theList3[['E']] <- factor(c('A', 'B', 'C'), ordered=TRUE)
class(theList3$E)

# Using the map_chr(class) will cause an error 
# because the return from element "E" is not an atomic vector, but two elements "ordered" and "factor".
theList3 %>% map_chr(class)

# The most direct way to resolve this issue is using map() return a list of element.
# However, the return result will not be an vector, but a list.
theList3 %>% map(class)

# Logical operation can be return from map_lgl() in a logical vector
# e.g. Check if each of the elements in this list has less than 3 rows
theList %>% map_lgl(function(x) NROW(x) < 3)

# map_df() returns data frames created by row-binding and column-binding respectively
# Suppose we have a function that create two columns data frame and
# the number of rows in the data frame depends on varaible x
buildDF <- function(x){
  data.frame(A=1:x, B=x:1)
}

listOfLengths <- list(3, 4, 1, 5)

# We can use map() return a list with 4 elements and each element is a data frame with length defined
listOfLengths %>% map(buildDF)

# Obviously, it would be more intuitive to have the result return in one single data frame in this case
listOfLengths %>% map_df(buildDF)

# Sometime, we only want to map the a list if certain condition is met.
# In such case, map_if() function allows use to define the condition before mapping.
# e.g. suppose we are only interested to mulitply the matrices in the list by 2 (Scalar Multiplication)
theList %>% map_if(is.matrix, function(x) x*2)

# In the returning list, only the matrix elements were multiplied by 2, but not the list element

# purrr package provides an alternative to pass in a formula to replace the anonymous function.
# The formula only takes up to two variables and they must be in .x and .y format.
theList %>% map_if(is.matrix, ~ .x*2)


### 2.3 - Map a data.frame ###

# Techically, a data frame should also be defined as list. 
# Therefore, we can also apply the map() function to a data frame.
# e.g. suppose we are interested to get the mean values from the diamonds data frame
data(diamonds, package='ggplot2')
diamonds %>% map_dbl(mean)

# We can also apply summarize_each() function from dplyr package
library(dplyr)
diamonds %>% summarize_each(funs(mean))

# It's worth to note that even though the return results are the same, 
# but the map_dbl() is returning a numeric vector and summarize_each() is returning a data.frame
# Also, in both cases, all the non-numeric columns return results of NA.


### 2.4 - Map over Multiple Inputs ###

# In purrr package,  map2() can be applied when processing two arguments at a time.
# e.g. adding the number of rows of two elements from two separated lists

# Create two lists
firstList <- list(A=matrix(1:16, 4), B=matrix(1:16, 2), C=1:5)
secondList <- list(A=matrix(1:16, 4), B=matrix(1:16, 8), C=15:1)

# Create a function that adds the number of rows from two elements
simpleFunc <- function(x, y){
  NROW(x) + NROW(y)
}

# Apply the simpleFunc() to sum the number of rows in each element of the two lists
# and return with a list of results using map2()
# Note: we are dealing with two arguments here firstList and secondList
map2(firstList, secondList, simpleFunc)

# We can also return the results with interger
map2_int(firstList, secondList, simpleFunc)

# More general, pmap can process a list of lists and return with a list.
pmap(list(firstList, secondList), simpleFunc)

pmap_int(list(firstList, secondList), simpleFunc)
