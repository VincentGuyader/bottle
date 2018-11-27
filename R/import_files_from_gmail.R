#' Title
#'
#' @param messages_id
#'
#' @return
#' @export
#' @importFrom gmailr message save_attachments
#' @importFrom purrr compact map
import_files_from_gmail <- function(messages_id,path="."){
  messages_id %>%
  map(message) %>%
  map(save_attachments,path=path) %>%
  compact() %>%
  unlist() %>%
  map_chr(clean_rename)
}
