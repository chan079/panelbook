set more off

use ajry08five, clear
xtset
gen dem = fhpolrigaug
gen inc = lrgdpch
ivregress 2sls d.dem (ld.(dem inc) = l2.(dem inc)) yr3-yr11 if sample==1, nocons vce(cl code_numeric)

set more on
