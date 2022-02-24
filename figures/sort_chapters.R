yaml_content <- read_yaml(here::here("_bookdown.yml"))
all_rmds <- fs::path_file(fs::dir_ls(here::here(), regexp = "^.+\\.[rR]md$"))
index_index <- which(all_rmds == "index.Rmd")
intro_index <- which(grepl("introduction", all_rmds))
bp_index <- which(grepl("Best_practices", all_rmds))
rmd_files <- all_rmds[c(index_index, intro_index, bp_index, setdiff(seq_along(all_rmds), c(index_index, intro_index, bp_index)))]
yaml_content$rmd_files <- rmd_files
write_yaml(yaml_content, here::here("_bookdown.yml"))
