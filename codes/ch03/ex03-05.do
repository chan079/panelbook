set more off

use klipsbal, clear
reg d.(lwage educ c.tenure##c.tenure isregul female c.age05##c.age05) i.year, vce(cl pid)
by pid: egen sd_educ = sd(educ)
list pid year educ if sd_educ > 0 & year==2005
list pid year educ if sd_educ > 0, sep(11)

set more on
