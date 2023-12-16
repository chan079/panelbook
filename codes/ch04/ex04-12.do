set more off

use mwp, clear
qui xtreg lnw married enrol yeduc exp expsq i.year, fe vce(r)
est store fe
qui xtfeis lnw married enrol yeduc i.year, slope(exp expsq) cluster(id)
est store feis
est tab fe feis, b star drop(i.year)

set more on
