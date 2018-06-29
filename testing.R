library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)


`(` <- function(e1) {
  "hi!"
}
replicate(5, (1 + 2))
rm("(")






x <- c(a = 1, b = 2, c = 3)
names(x)

names(x)[2] <- "two"
names(x)

`*tmp*` <- x
x <- `names<-`(`*tmp*`, `[<-`(names(`*tmp*`), 2, "two"))
x
rm(`*tmp*`)


y <- matrix(1:4, nrow = 2)
`[<-`(y, 1, 2, 5)


tt <- `[<-`(names(`*tmp*`), 2, "two")
`names<-`(`*tmp*`, tt)



v <- c(1,2)
v
`[`(v, 1)





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
