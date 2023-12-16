set more off

use klipsbal, clear
global X "educ c.tenure##c.tenure isregul female c.age05##c.age05 i.year"
qui reg lwage ${X}
est store pols
qui xtreg lwage ${X}, fe
est store fe
qui xtreg lwage ${X}, re
est store re
qui xtreg lwage ${X}, be
est store be
est tab pols fe re be, stats(r2 r2_w r2_b r2_o)

set more on
