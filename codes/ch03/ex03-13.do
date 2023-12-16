set more off

use grunfeld, clear
reg invest mvalue kstock i.company
xtreg invest mvalue kstock, fe

set more on
