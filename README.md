<!-- README.md is generated from README.Rmd. Please edit that file -->
zxcvbnR
=======

[![Travis-CI Build Status](https://travis-ci.org/jumpingrivers/zxcvbnR.svg?branch=master)](https://travis-ci.org/%3CUSERNAME%3E/zxcvbnR) [![Coverage Status](https://img.shields.io/codecov/c/github/jumpingrivers/zxcvbnR/master.svg)](https://codecov.io/github/jumpingrivers%3E/zxcvbnR?branch=master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/zxcvbnR)](https://cran.r-project.org/package=zxcvbnR)

[zxcvbn](https://github.com/dropbox/zxcvbn) is a password strength estimator inspired by password crackers. [zxcvbnR](#zxcvbnr) provides an R interface to this package.

Through pattern matching and conservative estimation, it recognizes and weighs 30k common passwords, common names and surnames according to US census data, popular English words from Wikipedia and US television and movies, and other common patterns like dates, repeats (aaa), sequences (abcd), keyboard patterns (qwertyuiop), and l33t speak.\#\# Example

### Installation

Currently the package isn't on CRAN. To install

``` r
devtools::install_github("jumpingrivers/zxcvbnR")
```

### Usage

The main function in the package is `check_password()`

``` r
library("zxcvbnR")
check_password("ABCDE")
#> Too guessable: risky password. (guesses < 10^3)
check_password("#rstats is great")
#> Very unguessable: strong protection from offline slow-hash scenario. (guesses >= 10^10)
```

The function also returns a list containing other details

``` r
res =check_password("ABCDE")
#> Too guessable: risky password. (guesses < 10^3)
res$feedback
#> $warning
#> [1] "Sequences like abc or 6543 are easy to guess"
#> 
#> $suggestions
#> [1] "Add another word or two. Uncommon words are better."
#> [2] "Avoid sequences"
```
