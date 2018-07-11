#install.packages("ggplot2")
library(ggplot2)
df <- data.frame(c("D0.5", "D1", "D2"), c(4.2, 10, 29.5))
names(df) <- c("dose", "len")
head(df)
#Basic line plot with points
ggplot(data=df, aes(x=dose, y=len, group=1)) + geom_line() + geom_point()
#change the line type
ggplot(data=df, aes(x=dose, y=len, group=1)) + geom_line(linetype = "dashed") + geom_point()
#change the color
ggplot(data=df, aes(x=dose, y=len, group=1)) + geom_line(color = "red") + geom_point()


