library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)

c <- 10
c(c = c)


a <- NULL
f <- function(a) 3 
f(a <- 1) # not guaranteed to evaluate because of lazy evaluation
a # a is still NULL
f(a = 1) # this is a inside the function
a # a is still NULL


a <- NULL
f <- function(a) a + 1 
f(a <- 1) # evaluates because a argument of function is evaluated in the function
a # a is 1
f(a = 2) # returns 3
a # a is still 1



a <- NULL
f <- function(a) a
f(a <- 1) # does not display return value
a # 1

f(a = a <- 1) # does not display return value
f(a = a <- 1 + 3) # does not display return value
f(a = a <- (1)) # does not display return value




f((a = a <- 1)) # displays
f(a = (a <- 1)) # displays

(f(a <- 1))


## withVisible	do_withVisible	C:\R-3.1.2\src\main\eval.c


withVisible(f(a <- 1))$visible
withVisible(f(a = a <- 1))$visible
withVisible(f(1))$visible
withVisible(f(a = 1))$visible


rinternals <- file.path(R.home("include"), "Rinternals.h")
file.show(rinternals)


withVisible(x <- 1)
withVisible((x <- 1))




a <- NULL
f <- function(a) a 
(f(a <- 1)) # forces display of return value
a # 1

a <- NULL
f <- function(a) (a) 
f(a <- 1) # return value is displayed
a # 1

a <- NULL
f <- function(a) a 
f((a <- 1)) # return value is displayed
a # 1

a <- NULL
f <- function(a) a 
f((a = 1)) # same as f(a <- 1) but with return value displayed
a # 1

# normal usage
a <- NULL
f <- function(a) a 
f(a = 1) 
a #NULL




a <- NULL
f <- function(a) a 
f(a = force(a <- 1)) 
a #1

a <- NULL
f <- function(a) a 
f(a = a <- 1) 
a #1






foo = function(a) 0
x = 1
foo(a=force(x=2))
x

foo = function(a) deparse(substitute(a))
x = 1
foo(a=force(x=2))
x




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
