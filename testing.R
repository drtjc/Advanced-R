library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)


bb <- lsf.str(baseenv(), pattern = "*<-", all.names = TRUE)
setdiff(base_fn, bb)


fn <- apropos("<-", where = TRUE, mode = "function")
length(fn)
base_fn <- fn[names(fn) == length(searchpaths())] # serachpaths always ends in package::base
names(base_fn) <- NULL


length(base_fn)


base_fn <- lsf.str(baseenv(), pattern = "*<-", all.names = TRUE)
base_f <- mget(base_fn, inherits = TRUE)
base_fp <- base_fn[as.logical(map(base_f, ~ is.primitive(.)))]
length(base_fp)
base_fp

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
