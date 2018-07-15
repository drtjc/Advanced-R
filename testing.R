library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)

bottles_of_beer <- function(i = 99) {
  message("There are ", i, " bottles of beer on the wall, ", i, " bottles of beer.")
  while(i > 0) {
    tryCatch(
      Sys.sleep(1),
      interrupt = function(err) {
        i <<- i - 1
        if (i > 0) {
          message(
            "Take one down, pass it around, ", i, 
            " bottle", if (i > 1) "s", " of beer on the wall."
          )
        }
      }
    )
  }
  message("No more bottles of beer on the wall, no more bottles of beer.")
}

bottles_of_beer(5)





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
