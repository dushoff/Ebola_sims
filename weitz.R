N0 <- 1*10^6 
days<-seq(0, 30, 1) 
start<-"2020-1-1"

init1 <- c(
	S = N0-1, E = 0, I = 1, U=0, R = 0
	, dead = 0, cases = 1, infections = 1
)

base <-c( N0=N0
	, sigma=1/4
	, gammaU=1/1
	, gammaI=1/7
	, cfr =0.02
	, betaU=3/7
	, betaI=30/7
	, symp = 0.1
) 

