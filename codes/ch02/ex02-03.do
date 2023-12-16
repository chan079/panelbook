set more off

use twowaycl, clear
xtset
reg y x1 x2 after, vce(cl id)
mat b = e(b)
mat V1 = e(V)
reg y x1 x2 after, vce(cl year)
mat V2 = e(V)
reg y x1 x2 after, vce(r)
mat V12 = e(V)
mat V = V1 + V2 - V12
ereturn post b V
ereturn display
reghdfe y x1 x2 after, noa cl(id year)

set more on
