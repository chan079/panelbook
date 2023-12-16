set more off

use nastabextr, clear
xtset
xtdescribe, p(16)
gen lnexp = ln(exp)
gen lnincdis = ln(incdis)
global X "lnincdis i.fnum cnum1 cnum2 educ female c.age##c.age empl married"
qui reg lnexp ${X}
by hid: egen obstotal = sum(e(sample))
su obstotal, meanonly
gen Si = obstotal == r(max)
xtdescribe if Si
reg lnexp ${X} i.year if Si, vce(cl hid)

set more on
