library(datasets)
data(iris)

# Question 1

?iris
tapply(iris$Sepal.Length,iris$Species,mean)

# Question 2

apply(iris[, 1:4], 2, mean)

# Question 3

data(mtcars)
?mtcars
tapply(mtcars$mpg, mtcars$cyl, mean)

# Question 4

mtcar_hp <- tapply(mtcars$hp, mtcars$cyl, mean)
mtcar_hp[3] - mtcar_hp[1]

# Question 5

debug(ls)
ls(myData)
