# d1 <- data.frame(x = c(1, 5, 6), y = c(2, 4, 3))
# d2 <- d1
# ref(d1, d2)
# d2[1,1] <- 7
# ref(d1, d2)



#d2[, 2] <- d2[, 2] * 2
#ref(d1, d2)


df1 <- data.frame(x = I(list(1:2, 1:3)))
df1
df2 <- df1
ref(df2, df1)

df2[1,1][[1]] <- list(4:5)
df2
ref(df2, df1)

