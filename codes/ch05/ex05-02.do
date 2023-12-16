set more off

use grunfeld, clear
gen lni = ln(invest)
gen lnm = ln(mvalue)
gen lnk = ln(kstock)
foreach v in lnm lnk {
	by company: egen bar_`v' = mean(`v')
	gen dev_`v' = `v' - bar_`v'
}
xtreg lni lnm lnk, be
ivregress 2sls lni (lnm lnk = bar_lnm bar_lnk)

use grunfeld, clear
drop if year < 1945 & company <= 5
gen lni = ln(invest)
gen lnm = ln(mvalue)
gen lnk = ln(kstock)
foreach v in lnm lnk {
	by company: egen bar_`v' = mean(`v')
	gen dev_`v' = `v' - bar_`v'
}
qui xtreg lni lnm lnk, be
est store be
qui xtreg lni lnm lnk, be wls
est store bewls
qui ivregress 2sls lni (lnm lnk = bar_lnm bar_lnk)
est store tsls
est tab be bewls tsls, b star

set more on
