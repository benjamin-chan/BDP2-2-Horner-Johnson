
clear all

local totaln = (78 + 61)
set obs `totaln'

gen t = _n <= 78
gen id = _n

set seed 5656

gen m0 = rnormal(77.69,17.56) if(t)
replace m0 = rnormal(82.23,16.21) if(!t)

gen m1 = rnormal(86.09,12.51) if(t)
replace m1 = rnormal(82.56,18.36) if(!t)

/*
reshape long m, i(id t) j(time)

anova m id t##time, repeated(time)

reshape wide m, i(id t) j(time)
*/


gen diff = m1 - m0
tabstat m0 m1 diff, by(t) stats(mean sd)

** abandon
** different attempt using 
/*
Arterburn, D. E., Westbrook, E. O., Bogart, T. A., Sepucha, K. R., Bock, S. N., 
& Weppner, W. G. (2011). Randomized Trial of a Video‐Based Patient Decision Aid 
for Bariatric Surgery. Obesity, 19(8), 1669-1675.

Group N:	77	75

Table 1: Baseline decisional self-efficacy
mean (SD)	87 (13) 87 (15)

Table 2: Change in decisional self-efficacy
mean (95% CI) 2.8 (0.9, 4.8) 3.0 (0.6, 5.4)

This yields CI width of 2 and 2.4
di (2*sqrt(77))/1.96
** 8.9540453
di (2.4*sqrt(75))/1.96
** 10.604393
*/

clear all
set obs 75
gen id = _n
set seed 75
gen m0 = rnormal(87,15)
set seed 76
gen m1 = rnormal(87,15)
gen diff0 = rnormal(3,10)
gen diff1 = rnormal(10,10)
gen f0 = m0 + diff0
gen f1 = m1 + diff1

tabstat m0 m1 f0 f1 diff0 diff1, stats(mean sd)




*==============================================================================
*  PSS
*==============================================================================
cd "H:\My Documents\@Projects\BDP\Horner-JohnsonWilli\PSS"

power twomeans 0, n(150 200) power(.8 .9) sd(10 20)
matrix results = r(pss_table)
drop _all
svmat results, names(col)
gen es = delta/sd

gsort -N power sd
drop m1 m2

order alpha N N1 N2 power delta 

list, noobs sepby(N power)

reshape wide delta, j(sd) i(alpha N N1 N2 power es)
list, noobs sepby(N)
order es, last
export excel using pregaid_pss_DecisionSelfEfficacy.xlsx, replace firstrow(var)

*==============================================================================
*  PSS revised to 80% power only and sd(15 20)
*==============================================================================
matrix drop _all

cd "H:\My Documents\@Projects\BDP\Horner-JohnsonWilli\PSS"

power twomeans 0, n(150 200) power(.8)  sd(15 20)
matrix results1 = r(pss_table)

*==============================================================================
*  PSS - PREPARATION FOR DECISION-MAKING
*==============================================================================

** based on Vandemheen Table 6 (2009)

ttesti 70 65.1 24.9 79 53.8 27.1

power twomeans 50, n(150 200) power(.8) sd(25 30)
matrix results2 = r(pss_table)

matrix results = results1\results2

drop _all
svmat results, names(col)
gen es = delta/sd

gsort m1 -N power sd

order alpha N N1 N2 power delta 
order es, last

format delta m2 %9.1f
format es %9.2f
list, noobs sepby(N)

export excel using pregaid_pss_DecisionSelfEfficacy.xlsx ///
	, sheet(RevCombined) sheetreplace firstrow(var)
