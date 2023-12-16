set more off

use ajry08five, clear
gen dem = fhpolrigaug
gen inc = lrgdpch
gen inc_1 = l.inc
qui xtabond dem yr3-yr11 if sample==1, pre(inc_1) vce(r) nocons
estat sargan
qui xtabond dem yr3-yr11 if sample==1, pre(inc_1) nocons
estat sargan
xtabond dem yr3-yr11 if sample==1, pre(inc_1) two nocons
estat sargan

set more on
