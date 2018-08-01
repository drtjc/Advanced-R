library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)


z <- expr(y <- x * 10)
z
typeof(z)
class(z)
str(z)
View(z)
attributes(z)

x <- 2
y = 2

lobstr::ast((z = y = 2)) 
lobstr::ast(z <- y <- 2) 
lobstr::ast(x <- 1)
x

a <- NULL
f <- function(a) a + 1
f(a <- 1)  # evaluates because a argument of function is evaluated in the function
a  # a is 1
f(a = 2)  # returns 3
a  # a is still 1




a <- 1
lobstr::ast(x = (a <- 2)) 
a

z <- substitute(y <- x * 10)
z
str(z)
View(z)

x <- 4
eval(z)
y

ast(z)
ast(!!z)


lobstr::ast(f(x, "y", 1))



quote(x) %>% class()
quote(x)







dot_every <- function(f, n) {
  i <- 1
  function(...) {
    if (i %% n == 0) cat(".")
    i <<- i + 1
    f(...)
  }
}


delay_by <- function(f, delay) {
  function(...) {
    Sys.sleep(delay)
    f(...)
  }
}

f <- dot_every(delay_by(runif, .1), 10)
e <- delay_by(dot_every(runif, 10), .1)
X <- lapply(1:100, f)
w <- lapply(1:100, e)





g <- runif %>% delay_by(.1) %>% dot_every(10) # 2 x 10 dots!
h <- runif %>% dot_every(10) %>% delay_by(.1) 


y <- lapply(1:100, g)
z <- lapply(1:100, h)

force(mean)











f <- function() {
  try(log("a"))
  2
}
f()










# df <- data.frame(x = c(1:5), y = 6:11)
# 
# aggregate(state.x77, list(Region = state.region), mean)
# str(state.region)
# state.x77
# 
# df <- data.frame(x = c(1:5, NA), y = 6:11)
# df
# 
# by <- as.factor(c("a", "b", "a", "a", "b", "b"))
# 
# str(by)
# res <- aggregate(df, list(by), sum, na.rm = TRUE)
# res
# str(res)
# 
# res <- aggregate(df, list(by), sum, na.rm = TRUE, simplify = FALSE)
# res
# str(res)
# 
# 
# 
# df <- data.frame(x = 1:5, y = 6:10)
# by <- as.factor(c("a", "b", "a", "a", "b"))
# 
# res <- aggregate(df, list(by), function(x) c(sum(x), mean(x)))
# res
# str(res)
# res
# 
# 
# res <- aggregate(df, list(by), function(x) c(sum(x), mean(x)), simplify = FALSE)
# res
# str(res)
# 
# 
# 
# res <- aggregate(df, list(by), function(x) {y <- c(sum(x), mean(x), sd(x), median(x)); y})
# res
# str(res)
# res$x[1, ]
# 
# 
# 
# res <- aggregate(df, list(by), function(x) {y <- c(sum(x), mean(x), sd(x), median(x)); dim(y) <- c(2,2); y}, simplify = FALSE)
# res
# str(res)
# 
# 
# 
# 
# 
# 
# f <- function() {
#   print("hi")
#   recover()
# }
# 
# 
# 
# #undebug(f)
# #debug(f, text="here")
# 
# f()
# class(sum)
# class(trace(sum))
# hist(rnorm(100)) # shows about 3-4 calls to sum()
# untrace(sum)
# 
# 
# # how to use debug in a nested function
# 
# isdebugged(f)
# debuggingState(TRUE)
# 
# ?traceback()
# 


# f1 <- factor("a")
# f2 <- factor("b")
# c(f1, f2)
# unlist(list(f1, f2))
# 
# combine(f1, f2)
# combine(list(f1, f2))



# ```{r, echo=FALSE}
# d <- c("1d", "2d", "nd")
# ho <- c("Atomic vector", "Matrix", "Array")
# he <- c("List", "Data frame", "")
# dt <- data.frame(Dimension = d, Homogeneous = ho, Heterogeneous = he, stringsAsFactors = FALSE)
# kable(dt) %>%
#   kable_styling(bootstrap_options = c("condensed", "hover"), full_width = FALSE, position = "left")
# ```

# TO DO - put in mapping between typeof and mode and storage.mode
# hierarachy: NULL < raw < logical < integer < double < complex < character < list < expression
