#' upload_to_seafile
#'
#' @param files files to upload
#' @param dossier_upload path in the repos
#' @param repos_id_destination repos id
#' @importFrom purrr map
#' @export
#'
upload_to_seafile <- function(files,
                              dossier_upload=dossier_upload(),
                              repos_id_destination= get_repo_id()){
files %>%
  map(~upload_file(path = .x,
                   output_directory = dossier_upload,
                   repos_id_destination = get_repo_id(name="Pauline")))
}
