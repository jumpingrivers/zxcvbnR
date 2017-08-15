#' @importFrom V8 v8
ct = NULL
.onLoad <- function(libname, pkgname){
  ct <<- V8::v8(global = "window")
  ct$source(system.file("js/zxcvbn.js", package = pkgname))
}