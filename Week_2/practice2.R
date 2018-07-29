source('pttTestFunction.R')
id = c(3142:3147)
URL = paste0("https://www.ptt.cc/bbs/Tech_Job/index", id, ".html")
filename = paste0(id, ".txt")
pttTestFunction(URL[1], filename[1])
mapply(pttTestFunction, 
       URL = URL, filename = filename)

