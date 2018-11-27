
<!-- README.md is generated from README.Rmd. Please edit that file -->
bottle
======

The goal of bottle is to drop email attachment (in gmail) directly into a folder in seafile.

Installation
------------

You can install the released version of bottle from [CRAN](https://CRAN.R-project.org) with:

``` r
remotes::install_github("VincentGuyader/seafile")
remotes::install_github("VincentGuyader/bottle")
```

How To
------

``` r
library(bottle)
library(seafile)
```

First connect your gmail account

``` r
gmailr::gmail_auth()
```

Then ping your seafile repos

``` r
seafile::ping()
```

Now upload attchment to seafile

``` r
get_messages_id() %>% 
  import_files_from_gmail(path = tempdir()) %>% 
  upload_to_seafile(repos_id_destination = get_repo_id(name = "My Library"))
```

And know, remove email from email and put in inside seafile label

``` r
get_messages_id() %>%
  remove_from_inbox()
```
