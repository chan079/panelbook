set more off

use wdi5bal, clear
global X "age0_19 age20_29 age65over lifeexp"
foreach v of global X {
	by id: egen bar_`v' = mean(`v')
}
xtreg sav ${X} bar_*, re vce(r)
testparm bar_*
reg sav ${X} bar_*, vce(cl id)
testparm bar_*

set more on
