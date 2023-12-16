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

su country
gen newid = neg*1000+country
xtset newid year
xtreg sr neg##c.lnrinc, fe vce(cl country)
xtreg sr lnrinc neg#c.lnrinc, fe vce(cl country)

set more on
