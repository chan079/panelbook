# Replication

## Arellano and Bond (1991)

[Arellano, M., and S. Bond (1991). Some tests of specification for panel data: Monte Carlo evidence and an application to employment equations. *Review of Economic Studies* 58(2): 277–297.](https://academic.oup.com/restud/article-abstract/58/2/277/1563354)

### Table 4

```stata
webuse abdata, clear
* Column (a1)
global X l(0/1).w l(0/2).(k ys) yr1979-yr1984
xtabond n $X, lags(2) vce(r)
xtabond2 l(0/2).n $X, gmm(n, lag(2 .)) iv($X) nol r
* Column (a2)
xtabond n $X, lags(2) two
xtabond2 l(0/2).n $X, gmm(n, lag(2 .)) iv($X) nol two
* Column (b)
global X l(0/1).w k l(0/1).ys yr1979-yr1984
xtabond n $X, lags(2) two
xtabond2 l(0/2).n $X, gmm(n, lag(2 .)) iv($X) two nol
```

### Table 5

```stata
webuse abdata, clear
* Column (e) AHd
ivregress 2sls d.n (ld.n = l2d.n l3d.n) l2d.n l(0/1).d.w l(0/2).d.(k ys) i.year, vce(cl id)
xtivreg n (l.n = l2.n l3.n) l2.n l(0/1).w l(0/2).(k ys) yr1981-yr1984, fd vce(r)
xtivreg n (l.n = l2.n l3.n) l2.n l(0/1).w l(0/2).(k ys) yr1980-yr1984, nocons fd vce(r)
* Column (f) AHl
ivregress 2sls d.n (ld.n = l2.n) l2d.n l(0/1).d.w l(0/2).d.(k ys) i.year, vce(cl id)
* Column (g) OLS - se different due to small sample adjustment
reg l(0/2).n l(0/1).w l(0/2).(k ys) i.year, vce(cl id)
* Column (h) WG - not replicable. why?
xtreg l(0/2).n l(0/1).w l(0/2).(k ys) i.year, re vce(r)
```

## Blundell and Bond (1998)

### Table 4

```stata
webuse abdata, clear
* Column 3 (1976-84 GMM-DIF)
xtabond2 l(0/1).(n w k) yr1978-yr1984, gmm(n w k, lag(2 .)) iv(yr1978-yr1984) r nol
xtabond n yr1978-yr1984, pre(w k, lag(1,.)) vce(r)
* Column 4 (1976-84 GMM-SYS) close but not exactly same
xtabond2 l(0/1).(n w k) yr1978-yr1984, gmm(l.(n w k)) iv(yr*) r h(1)
```

## Baltagi and Griffin (1983)

[Baltagi, B. H., and J. M. Griffin (1983). Gasoline demand in the OECD: an application of pooling and testing procedures. *European Economic Review* 22: 117−137.](https://www.sciencedirect.com/science/article/abs/pii/0014292183900776)

### Data

```stata
local url https://www.wiley.com/legacy/wileychi/baltagi/supp/Gasoline.dat
import delimited using "`url'", delimiters(" ", collapse) varnames(1) clear
encode country, gen(country_id)
drop country
rename country_id country
order country, first
xtset country year
save gasoline, replace
```

### Table 2

```stata
use gasoline, clear
* OLS
reg lgaspcar lincomep lrpmg lcarpcap
* Within
xtreg lgaspcar lincomep lrpmg lcarpcap, fe
* Between
xtreg lgaspcar lincomep lrpmg lcarpcap, be
* Swamy and Arora
xtreg lgaspcar lincomep lrpmg lcarpcap, re
```

### Table 3

```stata
use gasoline, clear
* OLS
reg lgaspcar lincomep lrpmg lcarpcap l.lgaspcar
* Within
xtreg lgaspcar lincomep lrpmg lcarpcap l.lgaspcar, fe
* Swamy and Arora
xtreg lgaspcar lincomep lrpmg lcarpcap l.lgaspcar, re
```
