set more off

use fastfood, clear
reg fte nj##after if balanced, vce(cl id)
reg d.fte nj, vce(cl id)
gen treat = nj*after
xtreg fte treat i.after, fe vce(r)

set more on
