#### R code chunks need to be specified with curly brackets ```{r, ...}
#### in order to be identified as R code by knitr::purl

#### important: each code chunk that has eval=F needs argument comment=NA
#### in order to be identified as R code by knitr::purl

setwd("U:/apis_for_social_scientists_a_review")
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

library(knitr)
library(stringr)
library(pacman)
p_load('httr', 'memoise',
       'googleway', 'httr', 'tidyverse', 'ckanr', 'jsonlite', 'readxl', 'curl', 'httr',
       'devtools', 'RCrowdTangle', 'dplyr', 'jsonlite', 'httr', 'remotes', 'dplyr',
       'ggplot2', 'tidyr', 'Radlibrary', 'dplyr', 'tidyr', 'DT', 'DemografixeR',
       'jsonlite', 'httr', 'httr', 'dplyr', 'httr', 'googleLanguageR', 'tidyverse',
       'tm', 'ggwordcloud', 'httr', 'ggplot2', 'tidyverse', 'googleway', 'mapsapi',
       'stars', 'tidyverse', 'googleLanguageR', 'googleLanguageR', 'httr', 'gtrendsR',
       'ggplot2', 'dplyr', 'httr', 'httr', 'httr', 'stringr', 'mediacloud', 'tidytext',
       'quanteda', 'quanteda', 'httr', 'academictwitteR', 'tidyverse', 'lubridate',
       'tidyverse', 'lubridate', 'rtweet', 'WikipediR', 'rvest', 'xml2', 'httr',
       'jsonlite', 'here', 'dplyr', 'ggplot2', 'tuber', 'tidyverse', 'purrr')

p_load_gh("quanteda/quanteda.corpora")
p_load_gh("cbpuschmann/RCrowdTangle")
p_load_gh("joon-e/mediacloud")
p_load_gh("facebookresearch/Radlibrary")

# identify all .Rmd files

Rmdfiles <- list.files(pattern = "\\.Rmd$")

# prepare output object
error_control <- data.frame(file = Rmdfiles, 
                            error = 0, 
                            error_message = NA)

# identify errors 
for (file in 1:length(Rmdfiles)) {
  tryCatch({
    knitr::purl(Rmdfiles[file]) # compress .Rmd to .R  
    source(substring(Rmdfiles[file], 1, nchar(Rmdfiles[file])-2)) # run .R
  }, error = function(e) {
    row_id <- which(error_control[, "file"] == Rmdfiles[file])
    error_control[row_id, "error"] <<- 1
    error_control[row_id, "error_message"] <<- list(e[1])
  }) # end tryCatch
} # end for

