set more off

use wdi5bal, clear
xtreg sav age0_19 age20_29 age65over lifeexp, be
collapse sav age0_19 age20_29 age65over lifeexp, by(id)
list in 1/2
reg sav age0_19 age20_29 age65over lifeexp

set more on
