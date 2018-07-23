library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)


x <- matrix(rnorm(20, 0, 10), nrow = 4)
x
apply(x, 1, min)


x1 <- sweep(x, 1, apply(x, 1, min), `-`)
x1

x2 <- sweep(x1, 1, apply(x1, 1, max), `/`)
x2

x <- matrix(1:20, nrow = 4)
x
dims <- dim(x)
dims

perm <- c(1, seq_along(dims)[-1])
seq_along(dims)
seq_along(dims)[-1]

perm

aa <- array(4:1, dims[perm])
aa
aperm(aa, order(perm))

sweep(x, 1, 4:1, `-`)
sweep(x, 1, 4, `-`)



str(array(4:1))





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
