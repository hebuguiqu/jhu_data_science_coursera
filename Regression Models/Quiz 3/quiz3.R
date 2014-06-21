# Question 1
data(mtcars)
fit <- lm(mpg ~ wt + factor(cyl),data=mtcars)
summary(fit)

# Question 2
fit2 <- lm(mpg ~ factor(cyl), data=mtcars)
summary(fit2)

# Question 3
fit3 <- lm(mpg ~ wt + factor(cyl)+ factor(cyl)*wt, data=mtcars)
anova(fit,fit3)

# Question 4
fit4 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
summary(fit4)

# Question 5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit5 <- lm(y ~ x)

# Question 6
dfbetas(fit5)

# Question 7

