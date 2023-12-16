set more off

use klipsbal, clear
global eqn "lwage educ c.tenure##c.tenure isregul i.year"
set matsize 1600
qui reg ${eqn} i.pid
di %6.4f e(r2)
areg ${eqn}, a(pid)
qui xtreg ${eqn}, fe
di %6.4f 1-e(rss)/e(tss)
di %6.4f e(r2), %6.4f e(r2_w), %6.4f e(r2_b), %6.4f e(r2_o)

set more on
