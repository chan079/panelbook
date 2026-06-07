# Replication

## Arellano and Bond (1991)

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
