set more off

use klipsbal, clear
xtreg lwage educ c.tenure##c.tenure isregul, fe
est store fe
xtreg lwage educ c.tenure##c.tenure isregul female c.age05##c.age05, re
est store re
hausman fe re, sigma

set more on
