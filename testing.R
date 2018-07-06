library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)



tryCatch(1, finally = print("Hello"))
e <- simpleError("test error")
## Not run: 
stop(e)
tryCatch(stop(e), finally = print("Hello"))
tryCatch(stop("fred"), finally = print("Hello"))

f2 <- function(x) {
  try(log(x))
  10
}
f2("a")

err <- try(log("a"))
class(err)
(a1 <- attributes(err))
str(a1$condition)
(a2 <- attributes(a1$condition))
str(a2)
attributes(a2)

cnd <- attributes(err)$condition
conditionCall(cnd)
conditionMessage(cnd)
class(cnd)
names(cnd)
str(cnd)


str(err)

err <- try(stop("Err"))



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
