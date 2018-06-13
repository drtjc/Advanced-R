rm(d)
d <- data.frame(1)
tracemem(t)
t[1] <- 1
untracemem(t)


rm(l)
l <- list(1)
tracemem(l)
l[1] <- 1
untracemem(l)

rm(v)
v <- 1:3
tracemem(v)
v[3] <- 4L
untracemem(v)
