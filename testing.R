library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)





rsts <- function() {
  withRestarts(
    {
      print("here");
      stop("error")
    },
    rst = function(t) t^2
  )
  print("end")
}












rsts <- function() {
  withRestarts(
    {
      print("here");
      stop("error")
    },
    rst = "rest" # will simply just pass on control
  )
  print("end")
}



tryCatch(
  error = function(cnd) print("caught error"),
  withCallingHandlers(
    condition = function(cnd) NULL,
    rsts()
  )
)

tryCatch(
  error = function(cnd) print("caught error"),
  withCallingHandlers(
    condition = function(cnd) {print(str(findRestart("rest"))); invokeRestart("rest")},
    rsts()
  )
)









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
