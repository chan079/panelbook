set more off

use basque-clean, clear
drop if regionno==1
global prs "1964(1)1969"
global pri "1964(1)1969"
global prd "1961(2)1969"
global prt "1960(1)1969"
synth gdpcap gdpcap($prt) invest($pri) popdens(1969) sec_agriculture($prd) sec_energy($prd) sec_industry($prd) sec_construction($prd) sec_svc_venta($prd) sec_svc_nonventa($prd) school_illit($prs) school_prim($prs) school_med($prs) school_high($prs), trunit(17) trperiod(1969) mspeperiod($prt) nested tech(dfp bfgs) allopt fig

set more on
