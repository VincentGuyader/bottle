#' create
#'
#' @param path
#' @importFrom readr locale
#' @importFrom glue glue
#' @export
#'
dossier_upload <-
  function( path = "compta/justificatif frais {annee}/{dmonth}-{month}" ) {
    glue::glue(
      path,
      annee = format(Sys.Date(), "%Y"),
      dmonth = format(Sys.Date(), "%m"),
      month = locale(date_names = "fr")$date_names$mon[as.numeric(format(Sys.Date(), "%m"))]
    )
  }
