set more off

use synth_smoking, clear
gen treated = state == 3 & year >= 1989
sdid cigsale state year treated, vce(placebo) seed(1) graph g1on

set more on
