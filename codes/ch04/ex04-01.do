set more off

use rsqex, clear
xtreg y x1 x2, fe vce(r)
predict xb, xb
foreach v of varlist y xb {
	by id: egen `v'_bar = mean(`v')
	gen `v'_d = `v' - `v'_bar
}
correlate y_d xb_d
di r(rho)^2
correlate y_bar xb_bar if year==1
di r(rho)^2
correlate y xb
di r(rho)^2

set more on
