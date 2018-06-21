library(lobstr)
library(magrittr)

f1 <- factor("a")
f2 <- factor("b")
c(f1, f2)
unlist(list(f1, f2))

combine(f1, f2)
combine(list(f1, f2))


a <- matrix(1:3, ncol = 3)
a
rownames(a) <- c("A")
colnames(a) <- c("a", "b", "c")
a
dimnames(a)



a <- matrix(1:6, nrow = 2, ncol = 3)
rownames(a) <- c("A", "B")
colnames(a) <- c("a", "b", "c")
a

f <- a[1, , drop = FALSE]
f
dim(f)
names(f)
rownames(f)
colnames(f)
dimnames(f)


# One vector argument to describe all dimensions
b <- array(1:12, c(2, 3, 2))
dimnames(b) <- list(c("one", "two"), c("a", "b", "c"), c("A", "B"))
b

e <- b[1, 1, , drop = FALSE] # don't drop dimensions
e # now an array
dim(e)
dimnames(e) # but still returns NULL
names(e) # this works but is the vector option!
