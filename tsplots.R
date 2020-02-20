library(ggplot2)
theme_set(theme_bw())

casePlot <- (
	ggplot(sim, aes(x=day, y=U))
	+ geom_line(size=1.5)
)

infPlot <- (
	ggplot(sim, aes(x=day, y=I))
	+ geom_line(size=1.5)
)

print(casePlot+scale_y_log10())
print(casePlot)

print(infPlot+scale_y_log10())
print(infPlot)
