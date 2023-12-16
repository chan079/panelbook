set more off

clear all
local n = 5000
local T = 7
set obs `=`n'*`T''
gen id = ceil(_n/`T')
bysort id: gen year = 2010+_n
xtset id year

set seed 1
by id: egen mu = total(rnormal()/(year==2011))
gen e = rnormal()
gen x = rnormal()
replace x = l.x + x if year>=2012
replace x = x + 0.5*mu + e
gen y = x*1 + mu + e

correlate x e
xtreg y x, fe
correlate l.x e
correlate l.x x
xtivreg y (x = l.x), fe

set more on
