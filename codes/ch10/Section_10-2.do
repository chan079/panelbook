set more off

clear all
local n 5
local T 50
set obs `=`n'*`T''
gen id = ceil(_n/`T')+1
by id, sort: gen year = _n
xtset id year

program drop _all  /* useful for multiple eval */
program panelsim, rclass
	capture drop x
	capture drop y
	gen x0 = rnormal()
	gen y0 = rnormal()
	by id: gen x = sum(x0)
	by id: gen y = sum(y0)
	drop x0
	drop y0
	xtreg y x, fe vce(r)
	matrix b = e(b)
	matrix V = e(V)
	return scalar tvalue = b[1,1]/sqrt(V[1,1])
end

simulate tvalue = r(tvalue), reps(1000) /* nodots */ seed(1): panelsim
gen reject = sqrt((`n'-1)/`n')*abs(tvalue) >= invttail(`n'-1,.025)
su

set more on
