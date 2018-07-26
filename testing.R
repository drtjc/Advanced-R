library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)


env <- new.env() # so the order is fixed
env$a <- 1:10
env$beta <- exp(-3:3)
env$logic <- c(TRUE, FALSE, FALSE, TRUE)
# what have we there?
utils::ls.str(env)

# compute the mean for each list element
eapply(env, mean)
unlist(eapply(env, mean))

# median and quartiles for each element (making use of "..." passing):
eapply(env, quantile, probs = 1:3/4)



df <- data.frame(x = c(1:5), y = 6:11)




aggregate(state.x77, list(Region = state.region), mean)
str(state.region)
state.x77

df <- data.frame(x = c(1:5, NA), y = 6:11)
df

by <- as.factor(c("a", "b", "a", "a", "b", "b"))

str(by)
res <- aggregate(df, list(by), sum, na.rm = TRUE)
res
str(res)

res <- aggregate(df, list(by), sum, na.rm = TRUE, simplify = FALSE)
res
str(res)



df <- data.frame(x = 1:5, y = 6:10)
by <- as.factor(c("a", "b", "a", "a", "b"))

res <- aggregate(df, list(by), function(x) c(sum(x), mean(x)))
res
str(res)
res


res <- aggregate(df, list(by), function(x) c(sum(x), mean(x)), simplify = FALSE)
res
str(res)



res <- aggregate(df, list(by), function(x) {y <- c(sum(x), mean(x), sd(x), median(x)); y})
res
str(res)
res$x[1, ]



res <- aggregate(df, list(by), function(x) {y <- c(sum(x), mean(x), sd(x), median(x)); dim(y) <- c(2,2); y}, simplify = FALSE)
res
str(res)








r <- list(x = list(1, 2, "a"), y = list("b", 3, "c")) 
s <- rapply(r, function(x) x + 1, "numeric", how = "replace")
s

t <- rapply(r, function(x) x + 1, "numeric", how = "unlist")
t

u <- rapply(r, function(x) x + 1, "numeric", deflt = "b", how = "unlist")
u


df <- data.frame(x = c(1,2,3), y = c(4,5,6), z = c(7,8,9))
f <- factor(c(1, 2, 1))
dff <- split(df, f)
dff

split.data.frame


class(1)


split(x = seq_len(nrow(df)), f = f)

how = c("unlist", 
        "replace", "list")
how <- match.arg("unlist")



x <- 1:10
f <- factor(c(1, 1, 2, 3, 2, 3, 1, 2, 1, 3))
f

xf <- split(x, f)
xf

tapply(x, f, cumsum)
str(tapply(x, f, cumsum))
str(tapply(x, f, sum, simplify = FALSE))
tapply(x, f)


df <- data.frame(x = c(1,2,3), y = c(4,5,6), z = c(7,8,9))
f <- factor(c(1, 2, 1))
tapply(df, f, sum)
tapply(df, f, sum, simplify = FALSE)
tapply(df, f)






?table





ind <- list(c(1, 2, 2), c("A", "A", "B"))
table(ind)
tapply(1:3, ind) #-> the split vector

intt <- interaction(ind)
str(intt)
tapply(1:3, ind) #-> the split vector


split(1:3, intt)
str(tapply(1:3, ind, function(x) x^2))
str(tapply(1:3, intt, function(x) x^2))



f <- function() {
  print("hi")
  recover()
}



#undebug(f)
#debug(f, text="here")

f()
class(sum)
class(trace(sum))
hist(rnorm(100)) # shows about 3-4 calls to sum()
untrace(sum)


# how to use debug in a nested function

isdebugged(f)
debuggingState(TRUE)

?traceback()



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
