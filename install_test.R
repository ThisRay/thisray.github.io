
message('| start install')

####



local({
  check_package <- function(pkg) {
    if (!suppressWarnings(suppressMessages(require(pkg, character.only = TRUE)))) {
      install.packages(pkg, repos = "http://wush978.github.io/R")
    }
  }
  lapply(c("rappdirs", "bitops", "curl"), check_package)
  lapply(c("stringi", "magrittr", "crayon", "digest"), check_package)
  #utils::install.packages("swirl", repos = "http://wush978.github.io/R")
  install.packages("devtools")
  devtools::install_github("thisray/swirl", force=TRUE)
})


####


library(swirl)
library(curl)
library(methods)
try(uninstall_course("swirl_cht_course"), silent=TRUE)
install_course_github(github_username='thisray', course_name='swirl_cht_course', branch = "master", multi = FALSE)
message(' ')
message('| install ok!')

if(grepl('mingw', sessionInfo()$R.version$os)){
	Sys.setlocale(category = "LC_ALL", locale = "cht")
	select_language(language="cht_win")
}else{
	Sys.setlocale(category = "LC_ALL", locale = "zh_TW.UTF-8")
	select_language(language="cht_mac")
}

message(' ')
message('| When you are ready to begin swirl, type : swirl()')
message('| change to English version menu, type : select_language(language="english")')
message(' ')
message(' ')
# select_language(language="chinese_traditional")
# select_language(language="english")
# swirl()
