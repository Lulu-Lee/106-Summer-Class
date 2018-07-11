pttTech_JobFunction <- function(URL, filename)
{
  #URL = "http://https://www.ptt.cc/bbs/Tech_Job/index.html"
  html = read_html(URL)
  title = html_nodes(html, "a")
  href = html_attr(title, "href")
  data = data.frame(title = toUTF8(html_text(title)), href = href)
  data = data[-c(1:10),]
  getContent <- function(x) {
    url = paste0("http://www.ptt.cc", x)
    tag = html_node(read_html(url), )
  }
  
}  

