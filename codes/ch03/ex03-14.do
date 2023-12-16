set more off

use fastfood, clear
gen treat = nj*after
areg fte treat i.after if balanced, a(id) vce(cl id)
xtreg fte treat i.after if balanced, fe vce(r)

set more on
