set more off

use hongkong, clear

global comp "japan korea us taiwan"
* Table XVI
reg hongkong $comp if yq >= tq(1993q1) & yq <= tq(1997q2)
predict hkpred, xb
* Table XVII
l yq hongkong hkpred if yq >= tq(1997q3) & yq <= tq(2003q4)
* Figures 1 and 2 together
twoway line hongkong hkpred yq if year >= 1993 & year <= 2003

set more on
