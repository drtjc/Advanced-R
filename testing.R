l1 <- list(1,2)
l2 <- list(3,4)
l <- list(l1, l2)
ref(l)
l[[1]][[1]] <- 5
ref(l)

# 
# s <- l[1]
# t <- l[[1]]
# lobstr::ref(s, t)
# 
# s[[1]][[1]] <- 5
# lobstr::ref(s, t)
# 
# t[[1]] <- s[[1]][[1]]
# t[[1]]
# lobstr::ref(s, t)


c1 <- list(1, 2, 3)
ref(c1)
c1[[3]] <- 4
ref(c1)


a1 <- list(1, 2, 3)
a2 <- a1
ref(a1, a2)
a1[[3]] <- 4
ref(a1, a2)

b1 <- list(1)
b2 <- list(2)
b2[[1]] <- b1[[1]]
b2[[1]]
ref(b1, b2)
b1[[1]] <- 3
ref(b1, b2)

a2 <- list(2)
lobstr::ref(a1, a2)

a1 <- a2
a1[[1]]
lobstr::ref(a1, a2)
a1[[1]] <- 3
lobstr::ref(a1, a2)
a2[[1]]