library(lobstr)
library(magrittr)


a <- matrix(1:6, nrow = 2, ncol = 3)
class(a)
is.matrix(a) # checks if has dim attribute of length 2
str(a)

b <- array(1:12, c(2, 3, 2))
class(b)
is.array(b)
str(b)

df <- data.frame(1:2, 3:4)
df
dim(df)
attributes(df)
is.matrix(df)
is.data.frame(df)









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