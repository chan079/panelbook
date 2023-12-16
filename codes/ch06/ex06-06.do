set more off

use ajry08five, clear
gen dem = fhpolrigaug
gen inc = lrgdpch
gen inc_1 = l.inc
qui xtabond dem yr3-yr11 if sample==1, pre(inc_1) vce(r) nocons
estat abond
qui xtdpd dem l.(dem inc) yr3-yr11 if sample==1, dgmm(dem) div(l2.inc,nodi) div(yr*) nocons vce(r)
estat abond

set more on
