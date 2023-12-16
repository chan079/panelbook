set more off

use wdi5bal, clear
xtsum lifeexp
use wdi5bal, clear
qui xtreg sav age0_19 age20_29 age65over lifeexp i.year, re vce(r)
est store re
qui xtreg sav age0_19 age20_29 age65over lifeexp i.year, fe vce(r)
est store fe
est tab re fe, keep(lifeexp) b se

set more on
