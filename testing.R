library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)

i <- 1
while(i < 10) {
  tryCatch({
    Sys.sleep(0.5)
    message("Try to escape")
  }, interrupt = function(x) {
    message("Try again!")
    i <<- i + 1
  })
}



i <- 1
while(i <= 3) {
  withCallingHandlers({
    Sys.sleep(0.5)
    message("Try to escape")
  }, interrupt = function(x) {
    print("Try again!")
    i <<- i + 1
    #print(class(x))
    print(computeRestarts())
    invokeRestart("resume")
    #invokeRestart("muffleMessage")
  })
}


r <- computeRestarts()[[1]]
class(r)
str(attributes(r))
r[[3]]
str(r)



withCallingHandlers(
  message = function(cnd) {lobstr::cst(); print(computeRestarts(cnd)); invokeRestart("muffleMessage")},
  expr = message("Hello") # withRestarts creates the restart muffleMessage
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
