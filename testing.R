library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)




range("Sturges")
range("tom")





show_time <- function(x = stop("Error!")) {
  stop <- function(...) Sys.time()
  print(x)
}
show_time()






f <- function(x = y <- {print("y1"); 1}, z = y <- {print("y2"); 2}) {
  x + z
}
f()





{print("x"); 1} + {print("y"); 2} 


a <- NULL
f <- function(a) (a) 
f(a = a <- 1) # evaluated outside of function
a #1

a <- NULL
f <- function(a = a <- 1) (a) # default value evaluated inside function
f()
a # NULL






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
