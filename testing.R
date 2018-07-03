library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)

f <- function() {
  print(parent.frame())
  print(sys.nframe())
  print(sys.frame(sys.nframe()))
  print(environment())
  print(sys.parent())
  print(sys.call())
  print(sys.on.exit())
  g <- function(x) {
    print(parent.frame())
    print(sys.nframe())
    print(sys.frame(sys.nframe()))
    print(environment())
    print(sys.parent())
    print(sys.call())
    print(sys.on.exit())
    #sys.status()
  }
  g()
}

f()

environment(f)
obj_addr(environment(sys.status))
obj_addr(globalenv())

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
