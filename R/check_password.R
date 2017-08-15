#' Check password
#'
#'  zxcvbn is a password strength estimator inspired by password crackers.
#'  Through pattern matching and conservative estimation, it recognizes and weighs 30k common passwords,
#'  common names and surnames according to US census data, popular English words from
#'  Wikipedia and US television and movies, and other common patterns like dates,
#'  repeats (aaa), sequences (abcd), keyboard patterns (qwertyuiop), and l33t speak.
#'
#'  The main result is returned as an invisible list.
#'
#'  This package provides an R interface to the underlying Javascript code. See
#'  the [GitHub](https://github.com/dropbox/zxcvbn) homepage for further details about the JS library.
#'  @details
#'  The function returns a list with the following components
#'  * guesses:  estimated guesses needed to crack password
#'  * guesses_log10: order of magnitude of guesses
#'  * crack_times_seconds : dictionary of back-of-the-envelope crack time estimations, in seconds, based on a few scenarios:
#'     - online_throttling_100_per_hour: online attack on a service that ratelimits password auth attempts
#'     - online_no_throttling_10_per_second: online attack on a service that doesn't ratelimit, or
#'     where an attacker has outsmarted ratelimiting
#'     - offline_slow_hashing_1e4_per_second: offline attack.
#'     Assumes multiple attackers, proper user-unique salting, and a slow hash function
#'      w/ moderate work factor, such as bcrypt, scrypt, PBKDF2
#'     - offline_fast_hashing_1e10_per_second: offline attack with user-unique salting but a fast hash function like SHA-1, SHA-256 or MD5.
#'     A wide range of reasonable numbers anywhere from one billion - one trillion
#'     guesses per second, depending on number of cores and machines. ballparking at 10B/sec.
#'
#'  * crack_times_display: same keys as crack_times_seconds, with friendlier display string values:
#'  "less than a second", "3 hours", "centuries", etc.
#'  * score:  Integer from 0-4 (useful for implementing a strength bar)
#'    - 0 too guessable: risky password. (guesses < 10^3)
#'    - 1  very guessable: protection from throttled online attacks. (guesses < 10^6)
#'    - 2 somewhat guessable: protection from unthrottled online attacks. (guesses < 10^8)
#'    - 3 safely unguessable: moderate protection from offline slow-hash scenario. (guesses < 10^10)
#'    - 4 very unguessable: strong protection from offline slow-hash scenario. (guesses >= 10^10)
#'  * feedback: verbal feedback to help choose better passwords. set when score <= 2.
#'    - feedback.warning:  explains what's wrong, eg. 'this is a top-10 common password'.
#'  Sometimes an empty string
#'    - feedback.suggestions a possibly-empty list of suggestions to help choose a less
#'    guessable password. eg. 'Add another word or two'
#'  * sequence: the list of patterns that zxcvbn based the guess calculation on.
#'  * calc_time: how long it took zxcvbn to calculate an answer, in milliseconds.
#'
#' @param password Character string to assess
#' @seealso https://github.com/dropbox/zxcvbn and
#' this [blog post](https://blogs.dropbox.com/tech/2012/04/zxcvbn-realistic-password-strength-estimation/)
#' @export
#' @examples
#' res = check_password("ABC")
#' res$feedback
#'
check_password = function(password) {
  res = ct$call("zxcvbn", password)
  message(nice_message(res$score))
  invisible(res)
}

