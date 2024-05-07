#' Create a new safe environment like new.env
#'
#' @export
new.safeenv <- function(...) {
  env <- new.env(...)
  class(env) <- c("safeenv::safeenv", class(env))
  return(env)
}

#' Dollar extraction
#'
#' @export
`$.safeenv::safeenv` <- function(obj, name) {
  if (!name %in% names(obj)) {
    stop(
      exceptions::LookupError(
        paste0("Name '", name, "' not found in environment")
      )
    )
  }
  return(.subset2(obj, name))
}

#' Dollar assignment
#'
#' @export
`$<-.safeenv::safeenv` <- function(obj, name, value) {
  assign(name, value, pos = obj, inherit = FALSE)
  return(obj)
}

#' Element extraction
#'
#' @export
`[[.safeenv::safeenv` <- function(obj, name) {
  return(`$.safeenv::safeenv`(obj, name))
}

#' Element assignment
#'
#' @export
`[[<-.safeenv::safeenv` <- function(obj, name, value) {
  return(`$<-.safeenv::safeenv`(obj, name, value))
}
