set more off

use twowaycl, clear
reghdfe y x1 x2 after, a(id) cl(id year)
xtivreg2 y x1 x2 after, fe cl(id year) small

set more on
