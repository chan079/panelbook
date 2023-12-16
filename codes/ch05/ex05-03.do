set more off

use crime4, clear
local X "lprbconv lprbpris lavgsen ldensity lwcon-lwloc lpctymle"
local Y "lprbarr lpolpc"
local TV "`Y' `X'"
local TI "lpctmin west central urban"
xtreg lcrmrte `TV' `TI', be
xtreg lcrmrte `TV' i.year, fe
local Z "lmix ltaxpc"
xtivreg lcrmrte `X' `TI' (`Y'=`Z') i.year, re ec2sls
xtivreg lcrmrte `X' (`Y'=`Z') i.year, fe
xtivreg lcrmrte `X' `TI' (`Y'=`Z'), be

set more on
