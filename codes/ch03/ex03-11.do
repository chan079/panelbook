set more off

use grunfeld, clear
xtset
xtreg invest mvalue kstock, fe
predict fit0, xb
predict fit1, xbu
twoway line invest fit0 fit1 year if company==2, lp(solid dash shortdash)

set more on
