set more off

use union, clear
qui xtprobit union age grade not_smsa south black i.year, pa c(ind) vce(r)
preserve
replace black = 0
predict phat0, mu
replace black = 1
predict phat1, mu
gen dphat = phat1-phat0
su phat0 phat1 dphat
restore

set more on
