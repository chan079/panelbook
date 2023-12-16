set more off

use testfe, clear
qui reg y x1 x2 z1
scalar a = e(rss)
predict uhat, resid
qui reg uhat i.id
scalar b = e(mss)*8
di e(N)/(2*7)*(b/a-1)^2

set more on
