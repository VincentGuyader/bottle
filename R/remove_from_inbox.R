#' Title
#'
#' @param messages_id
#'
#' @return
#' @export
#' @importFrom gmailr message save_attachments
#' @importFrom purrr compact map

remove_from_inbox <- function(messages_id = "Label_1",remove_labels="INBOX"){
  messages_id %>%
  map(~modify_message(id = .x, add_labels = add_labels,remove_labels=remove_labels))
}
