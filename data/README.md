# 데이터
Github로부터 직접 데이터를 읽어들이는 방법: 예를 들어 `testfe.dta`를 읽어들이려면
```stata
use https://github.com/chan079/panelbook/raw/main/data/testfe, clear
```
- ajry08five.dta: Income and Democracy Data, [Acemoglu et al. 2008 AER][AJRY08]
- artificial.dta: Artificial data
- basque-clean.dta: [Abadie and Gardeazabal, 2003][AG03], cleaned
- basque.dta: [Abadie and Gardeazabal 2003][AG03]
- climate.dta: [Burke, Hsiang, and Miguel, 2015][BHM15]
- co2pc.dta: CO2 emissions (MT per capita) and GDP per capita (constant 2010 US$); source: [WDI]
- compclust.dta: Simulated data
- crime4.dta: [Wooldridge's CRIME4][CRIME4]
- did3ex.dta: Simulated data for DID with T=3
- fastfood.dta: [Card and Krueger 1994][CarKru94], fastfood data, cleaned
- growth-ex.dta: Simulated data, growth example
- grunfeld.dta: Grunfeld, 1958; from [Stata][Stata]
- hongkong.dta: [Hsiao, Ching and Wan, 2012, J of Appl Econom][HCW12]
- htexample.dta: Hauman and Taylor example
- klipsbal.dta (version 13): [KLIPS] for employed, 2005-2015, balanced
- lfp.dta: Source?
- mroz.dta: A [Mroz 1987][Mroz87] data set
- mwp.dta: Panel data including wages and family status in [R `feisr` package][feisr]
- nastabextr.dta (version 13): A subset of [NASTAB][NASTAB] 1-10
- oecdca.dta: [WDI][WDI] data 1980-2015
- psidextract.dta: From [Stata][Stata]
- rsqex.dta: Simulated data for R-squareds
- sumhes91.dta: The [Summers and Heston 1991][SumHes91] data set
- sw2013.dta: [Semykina and Wooldridge, 2013][SemWoo13]
- synth_smoking.dta: [Tobacco Sales in 39 US States][smoking]; [Abadie, Diamond, and Hainmueller 2010][ADH10]
- tdum-ex.dta: Simulated data for period dummies
- testfe.dta: Simulated data
- twowaycl.dta: Simulated data for two-way cluster se
- union.dta: NLS Women 14-24 in 1968; from [Stata]
- vv98.dta: [Vella and Verbeek 1998][VelVer98] data
- vv98staggered.dta: [Vella and Verbeek, 1998][VelVer98], reduced for 3 period staggered adoption
- wdi1bal.dta: [WDI] annual balanced
- wdi1data.dta: [WDI] annual unbalanced
- wdi5bal.dta: [WDI] five year balanced
- wdi5data.dta: [WDI] five year unbalanced
- weakwithin.dta: Simulated data, weak within variability
- workfile_china.dta: [Autor, Dorn, and Hanson, 2013, The China syndrome](https://www.ddorn.net/data.htm)
- xttdum.dta: Simulated data
- xtvar.dta: [Data in `xtvar` Stata module][xtvar]

[ADH10]: https://www.tandfonline.com/doi/abs/10.1198/jasa.2009.ap08746
[AJRY08]: https://www.aeaweb.org/articles?id=10.1257/aer.98.3.808
[AG03]: https://www.aeaweb.org/articles?id=10.1257/000282803321455188
[BHM15]: https://www.nature.com/articles/nature15725
[CRIME4]: https://econpapers.repec.org/paper/bocbocins/crime4.htm
[CarKru94]: https://davidcard.berkeley.edu/papers/njmin-aer.pdf
[feisr]: https://cran.r-project.org/package=feisr
[Grunfeld]: https://www.stata-press.com/data/r9/xtmain.html
[HCW12]: https://onlinelibrary.wiley.com/doi/10.1002/jae.1230
[KLIPS]: https://www.kli.re.kr/klips
[Mroz87]: https://www.jstor.org/stable/1911029
[NASTAB]: https://www.kipf.re.kr/panel/
[SemWoo13]: https://onlinelibrary.wiley.com/doi/full/10.1002/jae.1266
[smoking]: https://ideas.repec.org/c/boc/bocode/s457334.html
[Stata]: https://www.stata.com/
[SumHes91]: https://academic.oup.com/qje/article-abstract/106/2/327/1905437
[WDI]: https://databank.worldbank.org/source/world-development-indicators
[xtvar]: https://ideas.repec.org/c/boc/bocode/s457944.html
[VelVer98]: https://onlinelibrary.wiley.com/doi/abs/10.1002/%28SICI%291099-1255%28199803/04%2913%3A2%3C163%3A%3AAID-JAE460%3E3.0.CO%3B2-Y
