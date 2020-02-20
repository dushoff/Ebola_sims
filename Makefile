## This is Ebola_sims
## rescued 2020 Feb 20 (Thu) to do coronavirus sims

current: target
-include target.mk

# -include makestuff/perl.def

######################################################################

## Content

Sources += $(wildcard *.R)

%.inc.Rout: %.sim.Rout inc.R
	$(run-R)
%.incplots.Rout: %.inc.Rout incplots.R
	$(run-R)
%.sim.Rout: %.Rout functions.Rout sim.R
	$(run-R)
%.tsplots.Rout: %.sim.Rout tsplots.R
	$(run-R)

######################################################################

### Makestuff

Sources += Makefile

## Sources += content.mk
## include content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk

## -include makestuff/wrapR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
