set more off

use sumhes91, clear
xtset country year
gen lnrinc = ln(rinc)
gen dgdp = d.gdp
gen neg = dgdp < 0
replace neg = . if dgdp==.
su neg
by country: egen evercom = max(com)
su evercom
drop if neg==. | opec==1 | evercom>0
xtset
su neg
xtreg sr lnrinc if neg==0, fe vce(r)
xtreg sr lnrinc if neg==1, fe vce(r)
xtreg sr neg##c.lnrinc, fe vce(r)

set more on
