yaml_content <- yaml::read_yaml(here::here("_bookdown.yml"))
all_rmds <- fs::path_file(fs::dir_ls(here::here(), regexp = "^.+\\.[rR]md$"))
index_index <- which(all_rmds == "index.Rmd")
intro_index <- which(grepl("Introduction", all_rmds))
bp_index <- which(grepl("Best_practices", all_rmds))
ref_index <- which(grepl("References_Appendix", all_rmds))

## This step might not be needed because fs::path_file should have returned a sorted list. But for sanity.

sorted_chapters <- sort(all_rmds[setdiff(seq_along(all_rmds), c(index_index, intro_index, bp_index, ref_index))])

rmd_files <- c(all_rmds[index_index], all_rmds[intro_index], all_rmds[bp_index], sorted_chapters, all_rmds[ref_index])
yaml_content$rmd_files <- rmd_files
yaml::write_yaml(yaml_content, here::here("_bookdown.yml"))
