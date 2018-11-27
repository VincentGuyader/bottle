
#' rename file
#'
#' @param from file path to rename
#'
#' @export
#'
clean_rename <- function(from){
  clean_vec <- function (vec, verbose = FALSE, unique = TRUE, keep_number = FALSE,
                         translit = TRUE, punct = TRUE)
  {

    old <- vec

    ext <- tools::file_ext(vec)
    vec <- tools::file_path_sans_ext(vec)

    vec <- tolower(vec)
    if (unique) {
      vec <- thinkr::make_unique(vec)
    }
    if (!keep_number) {
      vec <- make.names(vec)
    }
    if (translit) {
      vec <- stringi::stri_trans_general(vec, "latin-ascii")
    }
    if (punct) {
      vec <- vec %>% gsub(perl = TRUE, "[[:punct:]]+", "_",
                          .)
    }
    vec <- vec %>% gsub(perl = TRUE, "[[:space:]]+", "_", .) %>%
      gsub(perl = TRUE, "^_+", "", .) %>% gsub(perl = TRUE,
                                               "_+$", "", .) %>% gsub(perl = TRUE, "_+", "_", .) %>%
      tolower
    if (!keep_number) {
      vec <- make.names(vec)
    }
    if (unique) {
      vec <- thinkr::make_unique(vec)
    }
    if (verbose) {
      print(data.frame(old = old, new = vec))
    }

    vec <- paste(vec,ext,sep=".")
    invisible(vec)
  }

  out <- clean_vec(from)
  file.rename(from=from,to = out)
  out
}
#
