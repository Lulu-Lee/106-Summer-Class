source('pttTestFunction.R')
id = c(1:10)
URL = paste0("https://www.ptt.cc/bbs/Eng-Class/index", id, ".html")
filename = paste0(id, ".txt")
pttTestFunction(URL[1], filename[1])
mapply(pttTestFunction, 
       URL = URL, filename = filename)



## Loading Packages
library(bitops)
library(httr)
library(XML)
library(RCurl)
library(tm)
library(NLP)
library(tmcn)
library(jiebaRD)
library(jiebaR)
library(Matrix)
library(ggplot2)
library(varhandle)
library(knitr)


## Text Mining
from <- 2418 # 2018-07-18
to   <- 2430 # 2018-07-20
prefix = "https://www.ptt.cc/bbs/SENIORHIGH/index"

data <- list()
for( id in c(from:to) )
{
  url  <- paste0( prefix, as.character(id), ".html" )
  html <- htmlParse( GET(url) )
  url.list <- xpathSApply( html, "//div[@class='title']/a[@href]", xmlAttrs )
  data <- rbind( data, as.matrix(paste('https://www.ptt.cc', url.list, sep='')) )
}
data <- unlist(data)

head(data)


## Text to Hours/Days
getdoc <- function(url)
{
  html <- htmlParse( getURL(url) )
  doc  <- xpathSApply( html, "//div[@id='main-content']", xmlValue )
  day <- xpathSApply( html, "//*[@id='main-content']/div[4]/span[2]", xmlValue )
  temp <- gsub( "  ", " 0", unlist(day) )
  part <- strsplit( temp, split=" ", fixed=T )
  
  daystamp <- part[[1]][4]
  daystamp <- strsplit( daystamp, split=":", fixed=T )
  date <- daystamp[[1]][1]
  #print(date)
  name <- paste0('./DATA/', date, ".txt")
  write(doc, name, append = TRUE)
}

sapply(data, getdoc)

