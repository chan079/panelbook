set more off

use wdi5data, clear
global X "age65over lifeexp"
qui reg sav ${X}
keep if e(sample)
xtreg sav ${X}, be wls
by id: egen sav_bar = mean(sav)
foreach v of global X {
	by id: egen `v'_bar = mean(`v')
}
reg *_bar, vce(cl id)

set more on
