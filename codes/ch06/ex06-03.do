set more off

clear all
local n 5000
local T 10
set obs `=`n'*`T''
gen id = ceil(_n/`T')
by id, sort: gen year = 1990 + _n
xtset id year
set seed 1
gen e = rnormal()
by id: gen y = sum(e)
reg l(0/1).y
ivregress 2sls d.y (ld.y = l2.y), vce(cl id)
xtabond y

set more on
