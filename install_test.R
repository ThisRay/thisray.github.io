
message('start install')
install.packages("devtools")
devtools::install_github("thisray/swirl", force=TRUE)
library(swirl)
library(curl)
library(methods)
try(uninstall_course("swirl_cht_course"), silent=TRUE)
install_course_github(github_username='thisray', course_name='swirl_cht_course', branch = "master", multi = FALSE)
message('install ok')

if(grepl('mingw', sessionInfo()$R.version$os)){
	Sys.setlocale(category = "LC_ALL", locale = "cht")
	select_language(language="cht_win")
}else{
	Sys.setlocale(category = "LC_ALL", locale = "zh_TW.UTF-8")
	select_language(language="cht_mac")
}

message('type : swirl() , when you are ready to begin')
message('type : select_language(language="english") , change to English version menu')
# select_language(language="chinese_traditional")
# select_language(language="english")
# swirl()
