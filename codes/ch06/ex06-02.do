set more off

use ajry08five, clear
gen dem = fhpolrigaug
gen inc = lrgdpch
gen inc_1 = l.inc
xtabond dem yr3-yr11 if sample==1, pre(inc_1) vce(r) nocons

set more on
