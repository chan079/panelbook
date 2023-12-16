set more off

use workfile_china, clear
local X1 "l_shind_manuf_cbp t2"
local X2 "d_tradeusch_pw"
local Z2 "d_tradeotch_pw_lag"
reg d_sh_empl_mfg `X2' `X1' [aw=timepwt48], vce(cl statefip)
ivregress 2sls d_sh_empl_mfg (`X2'=`Z2') `X1' [aw=timepwt48], cl(statefip)

set more on
