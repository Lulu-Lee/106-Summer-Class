library(ggplot2)

ggplot(data=attitude, aes(x=learning, y=raises)) + geom_bar(stat="identity", fill="pink", colour="black")

