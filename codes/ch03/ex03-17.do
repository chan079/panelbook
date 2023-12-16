set more off

use wdi5bal, clear
global X "age0_19 age20_29 age65over lifeexp"
xtreg sav ${X}, fe
est store fe
xtreg sav ${X}, re
est store re
hausman fe re, sigma

set more on
