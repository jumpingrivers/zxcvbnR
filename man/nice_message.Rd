% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nice_message.R
\name{nice_message}
\alias{nice_message}
\title{Nice feedback for checking passwords
Prints a nice user feedback message.}
\usage{
nice_message(value)
}
\arguments{
\item{value}{An integer between 0 and 4}
}
\description{
Nice feedback for checking passwords
Prints a nice user feedback message.
}
\examples{
nice_message(check_password("ABC")$score)
nice_message(check_password("rstats is the best")$score)
}
