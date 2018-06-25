library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)

objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.function, objs)

# functions without arguments
f_arg_length <- funs %>% map_int(~ length(formals(.)))
f_arg_length[which.max(f_arg_length)]
sum(f_arg_length == 0) 

# all primitive functions return NULL for formals, but so do other functions with no arguments
f_arg_NULL <- funs %>% map_lgl(~ is.null(formals(.)))
sum(f_arg_NULL) 

f_arg_0 <- funs %>% map_lgl(~ !is.null(formals(.)) && length(formals(.)) == 0)
sum(f_arg_0) #0

f_arg_primitve <- funs %>% map_lgl(~ is.primitive(.))
sum(f_arg_primitve) 

f_arg_NULL_not_primitive <- funs %>% map_lgl(~ is.null(formals(.)) && !is.primitive(.))
sum(f_arg_NULL_not_primitive) # number of non-primitive functions with no arguments

# non-primitve functions with no arguments
str(funs[which(f_arg_NULL_not_primitive)])


y <- 358
funs[y]
formals(funs[[y]])
is.primitive(funs[[y]])

funs2 <- funs[ww]
typeof(funs2[[2]])



objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.primitive, objs)
length(funs)


length(funs)

formals(funs[[13]])
funs[[1]]

str(funs)

# f1 <- factor("a")
# f2 <- factor("b")
# c(f1, f2)
# unlist(list(f1, f2))
# 
# combine(f1, f2)
# combine(list(f1, f2))

objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.primitive, objs)
str(funs)


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
