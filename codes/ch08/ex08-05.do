set more off

use union, clear
xtlogit union age grade not_smsa south black i.year, re nolog
est store re
foreach v of varlist age grade not_smsa south {
	by idcode: egen bar_`v' = mean(`v')
}
xtlogit union age grade not_smsa south black bar_* i.year, re nolog
est store cre
xtlogit union age grade not_smsa south i.year, fe nolog
est store fe
est tab re cre fe, drop(bar_*) b stats(N)

set more on
