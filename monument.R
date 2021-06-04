
library(ggplot2)
library(ggforce)
library(RColorBrewer)
library(grid)
library(cowplot)

df = data.frame(x = rep(seq(10, 150, 1), 100), y = rep(0:140, times = 100, each = 150))

p0 = ggplot(df, aes(x = x, y = y)) +
  geom_raster(aes(fill = y), interpolate=TRUE) +
  scale_fill_gradient2(low="yellow", mid="orange", high="tomato", midpoint=50) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  theme_void() +
  theme(legend.position = "none")

c0 =  ggplot() + geom_circle(aes(x0 = 70, y0 = 50, r = 20), fill = "red") + coord_fixed() + theme_void()

p = ggplot() +
  annotate("segment", x = -Inf, xend = Inf, y = 0, yend = 0) +
  scale_x_continuous(limits = c(10, 150), expand = c(0, 0)) +
  scale_y_continuous(limits = c(0, 100), expand = c(0, 0))

for(i in 1:7){
p = p + geom_polygon(aes_string(x = c(i*10, 80, 160-(i*10)), y = c(0, i*10, 0)),
                     color = "white", fill = "black", size = 1)
}
p = p + 
  annotate("rect", xmin = 10, xmax = 30, ymin = 40, ymax = 50, color = "black", fill = "green") +
  annotate("segment", x = 10, xend = 10, y = 0, yend = 50, size = 3) +
  geom_circle(aes(x0 = 20, y0 = 45, r = 3), fill = "red") + 
  geom_polygon(aes(x = c(70, 80, 90), y = c(0, 10, 0)), color = "black", fill = "white") +
  coord_fixed() +
  theme_void()

g0 = ggplotGrob(p0); g = ggplotGrob(p); c = ggplotGrob(c0)
g0$heights <- g$heights
g0$widths <- g$widths

ggdraw(p0) +
draw_grob(c, x = 0, y = 0.4, height = 0.35) +
draw_grob(g, x = 0, y = 0, height = 1, vjust = 0.05) 




