set more off

use wdi5bal, clear
xtset id year, delta(5)
xtdescribe
reg sav age0_19 age20_29 age65over lifeexp i.year, vce(cl id)

set more on
