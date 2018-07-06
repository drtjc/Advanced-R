library(lobstr)
library(magrittr)
library(tidyverse)
library(purrr)
library(pryr)
library(rlang)
library(rlist)

class(last.dump)
typeof(last.dump)

str(last.dump)

debugger()

(suppressWarnings(file.remove("nosuchfile.no")))


options(error = recover)
options(error = quote(dump.frames(to.file = TRUE)))
options(error = NULL)
file_remove <- function(...) {
  if (!suppressWarnings(file.remove(...))) stop ("No such file")
}

file_remove("nosuchfile.no")

quote(file_remove())
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
