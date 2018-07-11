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




withCallingHandlers(
  condition = function(cnd) {print(class(cnd)); print(str(computeRestarts()))},
  {
    message("%")
    warning("?", call. = FALSE)
    stop("!", call. = FALSE)
  }
)


withCallingHandlers(
  message = function(cnd) {print(class(cnd)); print(str(computeRestarts()))},
  {
    message("%")
    #warning("?", call. = FALSE)
    #stop("!", call. = FALSE)
  }
)


withCallingHandlers(
  simpleMessage = function(cnd) print("is it simple?"),
  message("yes")
)

withCallingHandlers(
  message = function(cnd) print("is it simple?"),
  signalCondition(simpleMessage("yes")) # no default handler which prints message to screen, returs NULL
)

withCallingHandlers(
  message = function(cnd) {print("is it simple?"); invokeRestart("muffleMessage")},
  message("yes") # return NULL but is invisible
)







class(simpleMessage("yes"))
class(simpleWarning("yes"))
class(simpleError("yes"))
class(simpleCondition("yes"))

simpleMessage
simpleWarning
simpleError
simpleCondition

# so simpleCondition will not handle a message, warning, error or interrupt

signalCondition(cond)
# if not a constion then creates ne with simpleCondition(cond)



withCallingHandlers(
  message = function(cnd) print("is it simple?"),
  signalCondition(simpleCondition("yes")) 
)

withCallingHandlers(
  message = function(cnd) print("is it simple?"),
  signalCondition("yes") 
)

withCallingHandlers(
  condition = function(cnd) print("is it simple?"),
  signalCondition("yes") 
)



r <- computeRestarts()[[1]]
class(r)
str(attributes(r))
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
