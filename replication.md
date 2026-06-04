# Replication

## Arellano and Bond (1991)

### Table 4

```stata
webuse abdata, clear
* Column (a1)
xtabond n l(0/1).w l(0/2).(k ys) yr1979-yr1984, lags(2) vce(r)
xtabond2 l(0/2).n l(0/1).w l(0/2).(k ys) yr1979-yr1984, ///
  gmm(l.n) iv(l(0/1).w l(0/2).(k ys) yr1979-yr1984) nol r
* Column (a2)
xtabond n l(0/1).w l(0/2).(k ys) yr1979-yr1984, lags(2) vce(r) two
xtabond2 l(0/2).n l(0/1).w l(0/2).(k ys) yr1979-yr1984, ///
  gmm(l.n) iv(l(0/1).w l(0/2).(k ys) yr1979-yr1984) nol r two
* Column (b)
xtabond n l(0/1).w k l(0/1).ys yr1979-yr1984, lags(2) vce(r) two
xtabond2 l(0/2).n l(0/1).w k l(0/1).ys yr1979-yr1984, ///
  gmm(l.n) iv(l(0/1).w k l(0/1).ys yr1979-yr1984) two nol r
```

### Table 5

```stata
webuse abdata, clear
* Column (e) AHd
ivregress 2sls d.n (ld.n = l2d.n l3d.n) l2d.n l(0/1).d.w l(0/2).d.(k ys) i.year, vce(cl id)
* Column (f) AHl
ivregress 2sls d.n (ld.n = l2.n) l2d.n l(0/1).d.w l(0/2).d.(k ys) i.year, vce(cl id)
* Column (g) OLS - not exactly replicated
reg l(0/2).n l(0/1).w l(0/2).(k ys) i.year, vce(cl id)
* Column (h) WG - not exactly replicated
xtreg l(0/2).n l(0/1).w l(0/2).(k ys) i.year, fe vce(r)
```

## Blundell and Bond (1998)

### Table 4

```stata
* Column 3 (1976-84 GMM-DIF)
xtabond2 l(0/1).(n w k) yr1978-yr1984, gmm(n w k, lag(2 .)) iv(yr1978-yr1984) r nol
xtabond n yr1978-yr1984, pre(w k, lag(1,.)) vce(r)
* Column 4 (1976-84 GMM-SYS) close but not exactly same
xtabond2 l(0/1).(n w k) yr1978-yr1984, gmm(l.(n w k)) iv(yr*) r h(1)
```
