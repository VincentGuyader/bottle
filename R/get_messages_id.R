#' Title
#'
#' @param label_ids
#' @importFrom purrr map_chr
#' @importFrom gmailr messages
#' @importFrom magrittr %>%
#' @export
#'
get_messages_id <- function(label_ids = "INBOX"){

gmailr::messages(label_ids = label_ids)[[1]]$messages %>%
  map_chr("id")

}
