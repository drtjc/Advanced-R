library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)

show_condition <- function(code) {
  tryCatch(condition = function(cnd) "hi",
    {
      code
      NULL
    }
  )
}

show_condition(stop("!"))
show_condition(log("x"))
show_condition(10)
show_condition(warning("?!"))
show_condition({
  10
  message("?")
  warning("?!")
})




tryCatch(
  condition = function(cnd) conditionCall(cnd),
  log("x")
)

tryCatch(
  message = conditionMessage,
  log("x")
)

tryCatch(
  condition = identity,
  log("x")
)


tryCatch(
#  error = function(cnd) "hi",
  conditon = NULL,
  
  log("x")
)





tt <- function (expr) 
{
  tryCatch(condition = identity, {
    force(expr)
    return(NULL)
  })
}

condition = identity
rm(condition)


tt(log("x"))
tt2(log("x"))

#TJC what is message, error etc defined more than once







i <- 1
while(i <= 3) {
  withCallingHandlers({
    Sys.sleep(0.5)
    print("Try to escape")
  }, interrupt = function(x) {
    print("Try again!")
    i <<- i + 1
    print(class(x))
    print(computeRestarts())
    invokeRestart("resume")
  })
}


r <- computeRestarts()[[1]]
class(r)
str(attributes(r))
r[[3]]
str(r)







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
