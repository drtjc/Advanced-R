library(lobstr)
library(magrittr)
library(tidyverse)

df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3], stringsAsFactors = FALSE)
df
str(df)

# subsetting like a list
(df[1]) # subsetting a list with [ always return a list
is.data.frame(df[1]) # of 1 column - 1:3
ncol(df[1])
is.list(df[1]) # of one vector - 1:3
length(df[1]) # a list of one item - 1:3
df[[1]] # use [[ or $ to access a single item
df[1][1]
identical(df[1], df[1][1]) # TRUE since df[1] is a list of only one item
df[c("x", "y")] # select multiple columns


# subsetting like a matrix
df[1, ]
str(df[1, ]) # still a data frame
df[, 1]
str(df[, 1]) # now an int vector
df[, 1, drop = FALSE]
str(df[, 1, drop = FALSE]) # still a data frame
df[1:2, 2:3]

df[df[1] == 2, ] # still a data frame

df[df[1] == 2]
str(df[df[1] == 2]) # vector

df[T]
str(df[T])


df[matrix(T)]
unlist(df)

tt <- matrix(T)
tt
df[tt]
str(df[tt])

df[1]
class(df[1])
df[1] == 2
class(df[1] == 2)
str(df[1] == 2)
df[c(F, T, F)]


idx <- matrix(c(T, F, T, F, F, T, T, T, F), ncol = 3)
idx
df[idx]

idx2 <- matrix(c(F, T, F), ncol = 1)
idx2
df[idx2]

idx3 <- matrix(c(F, T, F), nrow = 1)
idx3
df[idx3]



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
