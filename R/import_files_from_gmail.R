#' Title
#'
#' @param messages_id
#'
#' @return
#' @export
#' @importFrom gmailr message save_attachments
#' @importFrom purrr compact map possibly
#' @importFrom magrittr %>%
import_files_from_gmail <- function(messages_id,path="."){

  safe_save_attachments <- possibly(save_attachments,otherwise="nope")
  messages_id %>%
  map(message) %>%
  map(safe_save_attachments,path=path) %>%
  # compact() %>%
  unlist() %>%
  map_chr(clean_rename)
}
