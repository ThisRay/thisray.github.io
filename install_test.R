
message('| start install')

####

local({
	check_package <- function(pkg) { 
		if(!suppressWarnings(suppressMessages(require(pkg, character.only = TRUE)))) {
		
			tryCatch({
				install.packages(pkg)
			}, error = function(a){try(install.packages(pkg, repos = "http://wush978.github.io/R"))
			}, warning = function(w){try(install.packages(pkg, repos = "http://wush978.github.io/R"))
			})
		
			# try(install.packages(pkg, repos = c("http://cran.ism.ac.jp/", "http://rstudio.org/_packages", "http://cran.rstudio.com")))
			# , type="source"
			# 
			#install.packages(pkg, repos = "http://wush978.github.io/R")
		}
	}

	testthat_install <- function(){		
		temp <- paste0(.libPaths()[1], "/testthat.zip")
		download.file("https://github.com/ThisRay/thisray.github.io/raw/master/zip/testthat.zip", temp, mode = "wb")
		unzip(temp,exdir=.libPaths()[1])
		file.remove(temp)
	}

	if('testthat' %in% installed.packages()[,1]){
		if(packageVersion('testthat')!='1.0.2'){
			testthat_install()
		}
	}else{
		testthat_install()
	}

	check_package("devtools")
	#install.packages("devtools")
	require(devtools)

	lapply(c("rappdirs", "bitops", "curl"), check_package)
	lapply(c("stringi", "magrittr", "crayon", "digest", "git2r"), check_package)
	lapply(c("yaml", "RCurl", "stringr"), check_package)

	#utils::install.packages("swirl", repos = "http://wush978.github.io/R")
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
