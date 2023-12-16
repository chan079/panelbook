set more off

use weakwithin, clear
xtsum x y
xtreg y x, fe
est store fe
xtreg y x, re
est store re
hausman fe re, sigma

set more on
