set more off

use oecdca, clear
xtreg ca lnrexrate d1 d2 d3, fe vce(r)
xtdpdsys ca d1 d2 d3, endo(lnrexrate) vce(r)
estat abond
xtdpdsys ca L(0/1).(d1 d2 d3), endo(lnrexrate, lag(1,.)) vce(r)
estat abond

set more on
