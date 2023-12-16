set more off

use testfe, clear
xtsum
qui xtreg y x1 x2, fe
est store fe
qui xtreg y x1 x2, re
hausman fe ., sigma
qui xtreg y x1 x2 z1, re
hausman fe ., sigma
foreach v of varlist x1 x2 {
	by id: egen bar_`v' = mean(`v')
}
reg y x1 x2 bar_*, vce(cl id)
testparm bar_*
reg y x1 x2 bar_* z1, vce(cl id)
testparm bar_*

set more on
