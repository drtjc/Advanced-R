library(lobstr)
library(magrittr)

f1 <- factor("a")
f2 <- factor("b")
c(f1, f2)
unlist(list(f1, f2))

combine(f1, f2)
combine(list(f1, f2))



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

