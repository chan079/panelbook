set more off

use xtvar, clear
pvar y1 y2, fd

ivregress 2sls d.y1 (ld.(y1 y2) = l2.(y1 y2)), nocons
ivregress 2sls d.y2 (ld.(y1 y2) = l2.(y1 y2)), nocons

qui pvar y1 y2, fd
pvarirf, nodraw table step(3)

qui ivregress 2sls d.y1 (ld.(y1 y2) = l2.(y1 y2)), nocons
mat a1 = e(b)
qui ivregress 2sls d.y2 (ld.(y1 y2) = l2.(y1 y2)), nocons
mat a2 = e(b)
mat A = [ a1 \ a2 ]
mat A1 = A
mat A2 = A1*A
mat A3 = A2*A
mat l A1
mat l A2
mat l A3

qui pvar y1 y2, fd
pvarirf, oirf nodraw table step(3)

gen e1 = y1-a1[1,1]*l.y1-a1[1,2]*l.y2 if e(sample)
gen e2 = y2-a2[1,1]*l.y1-a2[1,2]*l.y2 if e(sample)
xtset
local ivar = r(panelvar)
forv j=1/2 {
	tempvar tv
	by `ivar': egen `tv' = mean(e`j')
	qui replace e`j' = e`j'-`tv'
}
qui corr e1 e2, cov
mat S = r(C)
mat P = cholesky(S)
mat B0 = P
mat B1 = A*B0
mat B2 = A*B1
mat B3 = A*B2
mat l B0
mat l B1
mat l B2
mat l B3

set more on
