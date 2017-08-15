#' Nice feedback for checking passwords
#' Prints a nice user feedback message.
#' @param value An integer between 0 and 4
#' @examples
#' nice_message(check_password("ABC")$score)
#' nice_message(check_password("rstats is the best")$score)
#' @export
nice_message = function(value){
  switch(value + 1L,
         "Too guessable: risky password. (guesses < 10^3)",
         "Very guessable: protection from throttled online attacks. (guesses < 10^6)",
         "Somewhat guessable: protection from unthrottled online attacks. (guesses < 10^8)",
         "Safely unguessable: moderate protection from offline slow-hash scenario. (guesses < 10^10)",
         "Very unguessable: strong protection from offline slow-hash scenario. (guesses >= 10^10)")
}