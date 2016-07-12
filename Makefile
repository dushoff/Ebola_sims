# Ebola_sims
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: notarget

##################################################################


# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

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

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
