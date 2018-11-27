#' upload_to_seafile
#'
#' @param files files to upload
#' @param dossier_upload path in the repos
#' @param repos_id_destination repos id
#' @importFrom purrr map
#' @importFrom magrittr %>%
#' @importFrom seafile upload_file
#' @export
#'
upload_to_seafile <- function(files,
                              output_directory=folder_upload(),
                              repos_id_destination= get_repo_id()){
files %>%
  map(~seafile::upload_file(path = .x,
                   output_directory = output_directory,
                   repos_id_destination = repos_id_destination))
}
