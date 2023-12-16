set more off

use climate, clear
qui tab year, gen(yr_)
global model growth temp temp2 prec prec2 yr_*
qui xtfeis $model, slope(time time2) cluster(iso_id)
est store Base
qui xtfeis $model if wdinomiss>=20, slope(time time2) cluster(iso_id)
est store Over20
qui xtfeis $model if !oil, slope(time time2) cluster(iso_id)
est store NoOil
qui xtfeis $model if iso!="USA" & iso!="CHN", slope(time time2) ///
cluster(iso_id)
est store NoUS_CH
est tab Base Over20 NoOil NoUS_CH, drop(yr_*) b se stats(N r2_w)

set more on
