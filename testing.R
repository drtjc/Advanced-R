is.numeric(1)
is.numeric(1L)
is.numeric("1")

data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
fdata
is.numeric(fdata)
typeof(fdata)
