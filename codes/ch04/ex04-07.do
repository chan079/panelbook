set more off

use did3ex, clear
gen treat = tgroup*after
xtreg y treat i.period, fe vce(r)
xtreg y treat i.period if period==0 | period==1, fe vce(r)
mat b1 = e(b)
xtreg y treat i.period if period==0 | period==2, fe vce(r)
mat b2 = e(b)
di (b1[1,1]+b2[1,1])/2
reg y tgroup##after, vce(cl id)

set more on
