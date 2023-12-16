set more off

use union, clear
xtprobit union age grade not_smsa south black i.year, pa c(exc) vce(r)

set more on
