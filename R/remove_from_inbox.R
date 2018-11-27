#' Title
#'
#' @param messages_id
#'
#' @return
#' @export
#' @importFrom gmailr message save_attachments modify_message
#' @importFrom purrr compact map
#' @importFrom magrittr %>%

remove_from_inbox <-
  function(messages_id ,
           add_labels = "Label_1",
           remove_labels = "INBOX") {
    messages_id %>%
      map( ~ modify_message(
        id = .x,
        add_labels = add_labels,
        remove_labels = remove_labels
      ))
  }
