set more off

use klipsbal, clear
xtset
xtsum age05
reg lwage educ c.tenure##c.tenure isregul female c.age05##c.age05 i.year, vce(cl pid)

set more on
