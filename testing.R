library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)


e1 <- env(empty_env(), y = 1)
e2 <- env(e1, x = 2)

e <- new.env()
attr(e, "name") <- "xyzzy"
names(e1) <- "test"

obj_addr(e1)
obj_addr(e2)

x <- 3


where_all <- function(name, env = caller_env()) {
  #el <- list()
  
  if (identical(env, empty_env())) {
    # Base case - do nothing

  } else if (env_has(env, name)) {
    # Success case
    list.append(env, where_all(name, env_parent(env)))
  } else {
    # Recursive case
    where_all(name, env_parent(env))
  }
}

vvv <- where_all("x", e2)
vvv

uuu <- where_all("x")
uuu
obj_addr(globalenv())


ll <- list()
list.append(ll, sum(1,2,3))



x <- 5
where("x")
where("mean")







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
