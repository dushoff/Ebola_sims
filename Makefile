## This is Ebola_sims
## rescued 2020 Feb 20 (Thu) to do coronavirus sims
## Should consider: forking two repos (No!)
## Making clear, overlapping pipelines for different scenarios

current: target
-include target.mk

# -include makestuff/perl.def

######################################################################

## Content
## This was designed entirely for the Bellan subclinical stuff
## Now adding weitz corona subclinical

## Old sim.R now at ebolaSim.R

Sources += $(wildcard *.R)

# base.incplots.Rout:
# weitz.tsplots.Rout: weitz.R

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

-include makestuff/wrapR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
