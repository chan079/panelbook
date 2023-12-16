set more off

use vv98staggered, clear
gen gt = (1+d2)*10 + period
tabstat lnwage, by(gt)
di (.5592081 - .3630408) - (.3784498 - .4019072)
di (.5758101 - .3784498) - (.6612037 - .5592081)
di (.0953647 + .2196247)/2
xtreg lnwage union i.period, fe
xtreg lnwage union i.period if period <= 2, fe
xtreg lnwage union i.period if period >= 2, fe

set more on
