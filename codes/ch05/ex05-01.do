set more off

use grunfeld, clear
gen lni = ln(invest)
gen lnm = ln(mvalue)
gen lnk = ln(kstock)
foreach v in lnm lnk {
	by company: egen bar_`v' = mean(`v')
	gen dev_`v' = `v' - bar_`v'
}
xtreg lni lnm lnk, fe
ivregress 2sls lni (lnm lnk = dev_lnm dev_lnk)

set more on
