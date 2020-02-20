library(ggplot2)
library(dplyr)
theme_set(theme_bw())

# casePlot <- (
# 	ggplot(sim, aes(x=day, y=U))
# 	+ geom_line(size=1.5)
# )

# infPlot <- (
# 	ggplot(sim, aes(x=day, y=I))
# 	+ geom_line(size=1.5)
# )

## print(casePlot+scale_y_log10())
## print(infPlot+scale_y_log10())

sim <- with(as.list(base), (sim %>% mutate(
	rr = gammaI*(1-cfr)*I + gammaU*U
	, dr = gammaI*cfr*I
	, cfr_obs = dr/(rr+dr)
	, prop_clinical = I/(I+U)
)))

print(
	ggplot(sim, aes(x=day, y=cfr_obs))
	+ geom_line(size=1.5)
)

print(
	ggplot(sim, aes(x=day, y=prop_clinical))
	+ geom_line(size=1.5)
)

