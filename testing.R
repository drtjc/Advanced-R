library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)
library(pryr)





!!(1:10)

(a <- expr(mean(1:10)))
(b <- expr(mean(!!(1:10))))
eval(a)
eval(b)

as.list(a)
as.list(b)

a[[1]]
b[[1]]

typeof(a[[1]]) # symbol
typeof(b[[1]]) # symbol



a[[2]]
b[[2]]

typeof(a[[2]]) # language
typeof(b[[2]]) # integer

class(a[[2]]) # call
class(b[[2]]) # integer


lobstr::ast(!!a)
lobstr::ast(!!b)

lobstr::ast(1:1)
lobstr::ast(!!(1:1))
lobstr::ast(!!seq(1, 10))

lobstr::ast(!!mean(1:10))


lobstr::ast(`!!`(mean(1:10)))
lobstr::ast(mean(`!!`(1:10)))


lobstr::ast(!!mean(`!!`((1:10)))) # error
lobstr::ast(`!!`(mean(`!!`((1:10))))) # error
# first !! has lead to evaluation in context of mean, which is not a quasiquoted function


lobstr::ast(`!!`(mean(!!(1:10)))) # 1 !!(1:10) = T, T, T, ...



mean(`!!`(100))
mean(!!100)

`!!`(100)
expr(`!!`(100))


expr(!!100)




lobstr::ast(mean(!!c(T, T)))

lobstr::ast(!!mean(!!seq(1, 10)))

!!(1:10)
I(1:10)


lobstr::ast(1:10)
lobstr::ast(!!(1:10))



x <- quote(a + b)
substitute(x, list(a = 1, b = 2))
substitute_q(x, list(a = 1, b = 2))

substitute(a + b, list(a = 1, b = 2))

y <- expression(a+b)
substitute(y, list(a = 1, b = 2))

substituteDirect(x, list(a = 1, b = 2))

f <- function(x) x
gg <- substituteDirect(f)
is.function(gg)
environment(gg)

substituteDirect



#function (x, env) 
#{
#  stopifnot(is.language(x))
#  env <- to_env(env)
#  call <- substitute(substitute(x, env), list(x = x))
#  eval(call)
#}

#call <- substitute(substitute(x, env), list(x = x))
#eval(call)


eval(substitute(substitute(x, list(a = 1, b = 2)), list(x = x)))
eval(substitute(substitute(x, list(a = 1, b = 2)), list(x = quote(a + b))))


substitute(substitute(x, list(a = 1, b = 2)), list(x = x))
substitute(x, list(a = 1, b = 2))

eval(substitute(substitute(x), list(x = x))) # a +  b

substitute(x, list(a = 1, b = 2)) #x 

t <- substitute(x, list(a = 1, b = 2))
View(t)

#eval(substitute(, list(x = x)))


length(ex1 <- expression(1 + 0:9)) # 1
ex1
eval(ex1) # 1:10

length(ex3 <- expression(u, v, 1+ 0:9)) # 3
mode(ex3 [3])   # expression
mode(ex3[[3]])  # call
View(ex3)
rm(ex3)


# substitute
# substitute_q
# SubstututeDirect
# 
# enquote
# deparse
# delayedAssign
# call
# recall
# all.names
# do.call
# function
# is.language etc
# bquote
# sQuote, dQuote, Quotes, shQuote
# missing
# eval
# getParseData
# srcfile










A <- 2
f <- function(x) print(x^2)
env <- new.env()
parent.env(env)
assign("A", 10, envir = env)
assign("f", f, envir = env)
f <- function(x) print(x)
f(A)                                      # 2
do.call("f", list(A))                     # 2
do.call("f", list(A), envir = env)        # 4
do.call(f, list(A), envir = env)          # 2
do.call("f", list(quote(A)), envir = env) # 100
do.call(f, list(quote(A)), envir = env)   # 10
do.call("f", list(as.name("A")), envir = env) # 100

eval(call("f", A))                      # 2
eval(call("f", quote(A)))               # 2
eval(call("f", A), envir = env)         # 4
eval(call("f", quote(A)), envir = env)  # 100







enq <-function(cl) as.call(list(as.name("quote"), cl))

enq2 <- function(cl) call("quote", cl) 

q <- as.name("quote")
typeof(q)

enq(dd)
enq2(dd)
identical(enq(dd), enq2(dd))

f <- function(x) x
typeof(f)
is.call(f(2))

dd <- call("f", 2)
View(dd)
enquote(dd)

is.call(enq(dd))
is.call(dd)

g <- as.call(f)
enquote(f)

View(enq)




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

# TO DO - put in mapping between typeof and mode and storage.mode
# hierarachy: NULL < raw < logical < integer < double < complex < character < list < expression
