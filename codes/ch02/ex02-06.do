set more off

use klipsbal, clear
xtreg lwage educ c.tenure##c.tenure isregul female c.age05##c.age05 i.year, re vce(r)

set more on
