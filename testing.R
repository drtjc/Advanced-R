v <- c(x=1, y=2, z=3)
attributes(v)
is.vector(v)

attr(v, "t") <- "test"
attributes(v)
is.vector(v)

is.atomic(v)
