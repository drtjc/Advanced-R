library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)





m <- matrix(1:4, nrow = 1)
colnames(m) <- c("a", "b", "c", "d")
#colnames(m) <- c("a", "b")
#rownames(m) <- c("x", "y")
rownames(m) <- c("x")
m

m[1] # first element of vector - drops name
m[[1]] # first element of vector - drops name

m[1, ] # keeps col names
m[, 1] # keeps row names




m <- matrix(1:4, ncol = 1)
rownames(m) <- c("a", "b", "c", "d")
#colnames(m) <- c("a", "b")
#rownames(m) <- c("x", "y")
colnames(m) <- c("x")
m

m[1] # first element of vector - drops name
m[[1]] # first element of vector - drops name

m[1, ] # keeps col names
m[, 1] # keeps row names








l <- list()
str(l[0])
str(l[5])
str(l[NA])


l <- list(a = 1:2, b = 3:4)
str(l[0])
str(l[5])
str(l[NA])


df <- data.frame(1:2, 3:4)
str(df[0])
str(df[5])
str(df[-5])
str(df[NA])

m <- matrix(c(1,2,3,4), nrow = 2)
m
str(m[0])
str(m[5])
str(m[-5])
str(m[NA_character_])



g <- logical(0)
str(g[0])
str(g[5])
str(g[NA])

g <- c(T, F)
str(g[0])
str(g[5])
str(g[NA])






x <- NULL
x <- 1:2
str(x) # int vector 1:2
x <- NULL
x[1] <- 1:2 # gives warning
str(x) # int vector 1
x <- NULL
x[[1]] <- 1:2
str(x) # list of 1 int vector - 1:2

x <- NULL
x[1] <- 1L
str(x)

x <- NULL
x <- 1L
x
str(x)



df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3], stringsAsFactors = FALSE)
df <- map(df, as.character)
str(df)
df[] <- map(df, as.character)
str(df)



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
