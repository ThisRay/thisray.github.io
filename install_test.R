install.packages("devtools")
devtools::install_github("thisray/swirl")
library(swirl)
try(uninstall_course("swirl_cht_course"), silent=TRUE)
install_course_github(github_username='thisray', course_name='swirl_cht_course', branch = "master", multi = FALSE)

# select_language(language="chinese_traditional")
# select_language(language="english")
# swirl()
