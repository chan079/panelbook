set more off

use sw2013, clear
by id: egen children_bar = mean(children)
reg lnw educ age agesq lnw80 *_bar i.year, vce(cl id)
gen imr = .
levelsof year, local(yearlevels)
foreach year of local yearlevels {
	qui probit s age agesq educ lnw80 children* if year==`year'
	qui predict xb, xb
	qui replace imr = normalden(xb)/normal(xb) if year==`year'
	capture drop xb
}
reg lnw educ age agesq lnw80 *_bar c.imr##i.year, vce(cl id)

set more on
