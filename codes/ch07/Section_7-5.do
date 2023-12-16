set more off

use growth-ex, clear
xtdpdsys lny x1, pre(x2) endo(x3) two vce(r)

qui xtabond lny x1, pre(x2) endo(x3) two vce(r)
est store abond
qui xtdpd l(0/1).lny x1 x2 x3, dg(x2,l(1 .)) dg(lny x3) div(x1) hascons two vce(r)
est store dpd1
qui xtdpdsys lny x1, pre(x2) endo(x3) two vce(r)
est store dpdsys
qui xtdpd l(0/1).lny x1 x2 x3, dg(x2,l(1 .)) dg(lny x3) div(x1) lg(x2,lag(0)) lg(lny x3) hascons two vce(r)
est store dpd2
est tab abond dpd1 dpdsys dpd2, b se

xtdpd growth lny1 x1 x2 x3, dg(lny1 x2, lag(1 .)) div(x1) dg(x3) hascons two vce(r)
xtdpd growth lny1 x1 x2 x3, dg(lny1 x2, lag(1 .)) div(x1) dg(x3) lg(x2,l(0)) lg(lny x3) hascons two vce(r)

qui xtabond lny x1, pre(x2) endo(x3) two vce(r)
est store ab
qui xtabond lny x1, pre(x2) endo(x3) two nocons vce(r)
est store abnoc
qui xtabond2 l(0/1).lny x1 x2 x3, gmm(x2 l.(lny x3)) iv(x1) nol two r
est store ab2dif
est tab ab abnoc ab2dif, b se

qui xtdpdsys lny x1, pre(x2) endo(x3) two vce(r)
est store dpdsys
qui xtabond2 l(0/1).lny x1 x2 x3, gmm(x2 l.(lny x3)) iv(x1,eq(d)) h(2) two r
est store ab2h2
qui xtabond2 l(0/1).lny x1 x2 x3, gmm(x2 l.(lny x3)) iv(x1,eq(d)) two r
est store ab2h3
est tab dpdsys ab2h2 ab2h3, b se

global eqn "growth lny1 x1 x2 x3"
qui xtdpd ${eqn}, dgmm(x2,l(1 .)) dg(lny x3) div(x1) nocons hascons two vce(r)
est store dpdab
qui xtabond2 ${eqn}, gmm(x2 lny1 l.x3) iv(x1) nol two r
est store ab2nol
qui xtdpd ${eqn}, dg(x2,l(1 .)) dg(lny x3) div(x1) lg(x2,l(0)) lg(lny x3) hascons two vce(r)
est store dpdsys
qui xtabond2 ${eqn}, gmm(x2 lny1 l.x3) iv(x1,eq(d)) h(2) two r
est store ab2h2
est tab dpdab ab2nol dpdsys ab2h2, b se

use tdum-ex, clear
xtset
qui xtabond y, vce(r)
est store y
replace y = y+10
qui xtabond y, vce(r)
est store y10
replace y = y+90
qui xtabond y, vce(r)
est store y100
est tab y y10 y100, b se

use tdum-ex, clear
qui xtabond y, inst(yr2-yr4) vce(r)
est store y
replace y = y+10
qui xtabond y, inst(yr2-yr4) vce(r)
est store y10
replace y = y+90
qui xtabond y, inst(yr2-yr4) vce(r)
est store y100
est tab y y10 y100, b se

use tdum-ex, clear
xi: xtabond y, inst(i.year)
est store y_stata
replace y = y+10
qui xi: xtabond y, inst(i.year)
est store y10_stata
est tab y_stata y10_stata, b se

xtdpdsys y x1
xtdpd l(0/1).y x1, dg(y) lg(y) div(x1)
xtdpdsys y yr2-yr4
xtdpd l(0/1).y yr2-yr4, dg(y) lg(y) div(yr2-yr4)
xtdpd l(0/1).y yr2-yr4, dg(y) lg(y) div(yr2-yr4) hascons

set more on
