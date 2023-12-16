set more off

use co2pc, clear
keep if pop60 >= 1e6 & balanced
by id: egen xbar = mean(x)
xtreg y c.x##c.x, fe vce(r)
mat b = e(b)
di -0.5*b[1,1]/b[1,2]
su x
gen xd = x-xbar
xtreg y c.xd##c.xd, fe vce(r)
mat b = e(b)
di -0.5*b[1,1]/b[1,2]
su xd
su xd if xd >= 1.7085951
gen turn1 = xbar-0.5*b[1,1]/b[1,2]
l iso2c country year y x turn1 if x < . & x > turn1, sep(0)
xtreg y c.x##c.x c.xbar#c.x, fe vce(r)
mat b = e(b)
di -0.5*b[1,1]/b[1,2]
di -0.5*b[1,3]/b[1,2]
gen turn2 = -0.5*(b[1,1]+b[1,3]*xbar)/b[1,2]
su x if x > turn2
l iso2c country year y x turn1 if x < . & x > turn2, sep(0)
xtfeis y c.x#c.x, slope(x) sp addsp(ci_) cluster(id)
twoway scatter ci_x xbar if year==2015

set more on
