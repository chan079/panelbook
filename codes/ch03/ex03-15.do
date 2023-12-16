set more off

use wdi5bal, clear
global X "age0_19 age20_29 age65over lifeexp"
foreach v of global X {
	by id: egen bar_`v' = mean(`v')
}
qui reg sav ${X} bar_*, vce(cl id)
est store pols
qui xtreg sav ${X} bar_*, re vce(r)
est store re
qui xtreg sav ${X}, fe vce(r)
est store fe
est tab pols re fe, b star

set more on
