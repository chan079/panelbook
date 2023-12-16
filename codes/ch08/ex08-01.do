set more off

use union, clear
xtprobit union age grade not_smsa south black i.year, pa c(ind) vce(r)
xtlogit union age grade not_smsa south black i.year, pa c(ind) vce(r)

set more on
