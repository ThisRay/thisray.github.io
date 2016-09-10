
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
	select_language(language="cht_win2")
}else{
	Sys.setlocale(category = "LC_ALL", locale = "zh_TW.UTF-8")
	select_language(language="cht_mac")
}


message("目前預設語言為繁體中文, 如需使用英文介面請輸入指令 : select_language(language="english") ")
message("開始課程請輸入 : swirl()")
# select_language(language="chinese_traditional")
# select_language(language="english")
# swirl()
