#### important: each code chunk that has eval=F needs argument comment=NA
#### in order to be included by knitr::purl

library(knitr)
library(stringr)

# define .gen_pacman_chunk on local machine
.gen_pacman_chunk <- function(x = NULL) {
  if (is.null(x)) {
    file_name <- knitr::current_input()
  } else {
    file_name <- stringr::str_subset(dir(), x)[1]
  }
  lines_text <- readLines(file_name) 
  packages <- gsub("library\\(|\\)", "",  
                   unlist(stringr::str_extract_all(lines_text,  
                                                   "library\\([a-zA-z0-9]*\\)|p_load\\([a-zA-z0-9]*\\)"))) 
  packages <- packages[packages!="pacman"] 
  packages <- packages[packages!="p_load("] 
  packages <- paste("# install.packages('pacman')", "library(pacman)", "p_load('", paste(packages, collapse="', '"), "')",sep="") 
  packages <- stringr::str_wrap(packages, width = 80) 
  packages <- gsub("install.packages\\('pacman'\\)", "install.packages\\('pacman'\\)\n", packages) 
  packages <- gsub("library\\(pacman\\)", "library\\(pacman\\)\n", packages)
  cat(packages)
  invisible(x)
}

# identify all .Rmd files
setwd("U:/apis_for_social_scientists_a_review")
Rmdfiles <- list.files(pattern = "\\.Rmd$")

# prepare output object
error_control <- data.frame(file = Rmdfiles, 
                            error = 0, 
                            error_message = NA)

# identify errors 
tryCatch(
  {
    for (file in 1:length(Rmdfiles)) {
    knitr::purl(Rmdfiles[file]) # compress .Rmd to .R  
    source(substring(Rmdfiles[file], 1, nchar(Rmdfiles[file])-2)) # run .R
    } # end for

  }, error = function(e) {
    row_id <- which(error_control[, "file"] == Rmdfiles[file])
    error_control[row_id, "error"] <<- 1
    error_control[row_id, "error_message"] <<- e[1]
    }
) # end tryCatch


