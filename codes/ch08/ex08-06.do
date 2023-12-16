set more off

use union, clear
qui xtlogit union age grade not_smsa south i.year, fe nolog
margins, dydx(age grade)

set more on
