library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)







v <- list(a = 1, b = 2)
v
v[[1]] # drops name
v[1] # doesn't drop name


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
