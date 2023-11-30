cd "C:\\Datasets\ATUS\loneliness\data\stata\"

set more off
use "atusrost0321.dta"
sort tucaseid tulineno
save "atusrost0321.dta", replace
egen hhsize = count(_n), by(tucaseid)
egen hhchild1 = count(_n) if teage <= 17, by(tucaseid)
egen hhchild = max(hhchild1), by(tucaseid)
egen ygchage = min(teage), by(tucaseid)
replace ygchage = 0 if ygchage < 0
gen yngchild = 0
replace yngchild = 1 if ygchage <= 2
gen spouse1 = 0
replace spouse1 = 1 if terrp == 20
egen spouse = max(spouse1), by(tucaseid)
gen partner1 = 0
replace partner1 = 1 if terrp == 21
egen partner = max(partner1), by(tucaseid)
by tucaseid: drop if _n > 1
replace hhchild = 0 if hhchild == .
save "hhvars.dta", replace

clear all
set more off
use "atuscps0321.dta"
sort tucaseid tulineno
save "atuscps0321.dta", replace
merge 1:1 tucaseid tulineno using "atusrost0321.dta"
drop _merge
save "rostcps0321.dta", replace
sort tucaseid tulineno
gen resp = 0
replace resp = 1 if tulineno == 1
gen partner1 = 0
replace partner1 = 1 if (terrp == 21 | terrp == 20)
egen partner = max(partner1), by(tucaseid)
gen partage1 = teage if partner1 == 1
egen partage = max(partage1), by(tucaseid)
gen parteduc1 = peeduca if partner1 == 1
egen parteduc = max(parteduc1), by(tucaseid)
gen partemp1 = 1 if prempnot == 1 & partner1 == 1
egen partemp = max(partemp1), by(tucaseid)
sort tucaseid
by tucaseid: drop if _n > 1
save "rostcps0321.dta", replace
merge 1:1 tucaseid using "hhvars.dta"
drop _merge
save "rostcps0321.dta", replace

clear all
set more off
use "rostcps0321.dta"
merge 1:1 tucaseid using "atusresp0321.dta"
drop _merge
save "rostcpsresp0321.dta", replace
drop if tulineno != 1
gen married = 0
replace married = 1 if pemaritl ==1 | pemaritl==2
gen divsep = 0
replace divsep = 1 if pemaritl == 5 | pemaritl == 5
gen metro = 0
replace metro = 1 if gtmetsta ==1 | gemetsta ==1
gen loinc = 0
replace loinc = 1 if hufaminc <= 6 & hryear4 <= 2009 | hefaminc <= 6 & hryear4 >= 2010
gen inc2040 = 0
replace inc2040 = 1 if hufaminc >=7 & hufaminc <=10 & hryear4 <= 2009 | hefaminc >=7 & hefaminc <= 10 & hryear4 >= 2010
gen inc4060 = 0
replace inc4060 = 1 if hufaminc >= 11 & hufaminc <= 12 & hryear4 <=2009 | hefaminc >= 11 &hefaminc <= 12 & hryear >=2010
gen inc6075 = 0
replace inc6075 = 1 if hufaminc == 13 & hryear4 <= 2009 | hefaminc == 13 & hryear4 >= 2010
gen inc75100 = 0
replace inc75100 = 1 if hufaminc == 14 & hryear4 <= 2009 | hefaminc == 14 & hryear4 >= 2010
gen inc100150 = 0
replace inc100150 = 1 if hufaminc == 15 & hryear4 <= 2009 | hefaminc == 15 & hryear4 >= 2010
gen inc150p = 0
replace inc150p = 1 if hufaminc == 16 & hryear4 <= 2009 | hefaminc == 16 & hryear4 >= 2010
gen nopartner = 0
replace nopartner = 1 if partner == 0
gen partnohsdip = 0
replace partnohsdip = 1 if parteduc <= 38
gen parthsdip = 0
replace parthsdip = 1 if parteduc == 39
gen partsomcol = 0
replace partsomcol = 1 if parteduc >= 40 & parteduc <= 42
gen partcoldeg = 0
replace partcoldeg = 1 if parteduc >= 43
gen single_parent = 0
replace single_parent = 1 if (hhchild < 0 & partner == 0)
gen nohsdip = 0
replace nohsdip = 1 if peeduca <= 38
gen hsdip = 0
replace hsdip = 1 if peeduca == 39
gen somcol = 0
replace somcol = 1 if peeduca >= 40 & parteduc <= 42
gen coldeg = 0
replace coldeg = 1 if peeduca >= 43
gen white = 0
replace white = 1 if ptdtrace ==1
gen black = 0
replace black = 1 if ptdtrace ==2
gen native = 0
replace native = 1 if ptdtrace==3
gen asian = 0
replace asian = 1 if ptdtrace ==4
gen pacisl = 0
replace pacisl = 1 if ptdtrace ==5
gen multi = 0
replace multi = 1 if ptdtrace >=6
recode ptdtrace (1 = 1 "White") (2 = 2 "Black") (3 = 3 "Native American") (4 = 4 "Asian") (5 = 5 "Hawaiian/Pacific Islander") (6/26 = 6 "Multiple or other"), gen(racecat)
gen male = 0
replace male = 1 if tesex ==1
gen otherrc = 0
replace otherrc = 1 if pacisl == 1 | multi == 1
gen hisp = 0
replace hisp = 1 if pehspnon ==1
gen wkend = 0
replace wkend = 1 if tudiaryday ==1 | tudiaryday ==7
gen tuthurs = 0
replace tuthurs = 1 if tudiaryday >= 3 & tudiaryday <= 5
gen sun = 0
replace sun = 1 if tudiaryday == 1
gen mon = 0
replace mon = 1 if tudiaryday == 2
gen tue = 0
replace tue = 1 if tudiaryday == 3
gen wed = 0
replace wed = 1 if tudiaryday == 4
gen thr = 0
replace thr = 1 if tudiaryday == 5
gen fri = 0
replace fri = 1 if tudiaryday == 6
gen sat = 0
replace sat = 1 if tudiaryday == 7
gen yr2003 = 0
replace yr2003 = 1 if tuyear == 2003
gen yr2004 = 0
replace yr2004 = 1 if tuyear == 2004
gen yr2005 = 0
replace yr2005 = 1 if tuyear == 2005
gen yr2006 = 0
replace yr2006 = 1 if tuyear == 2006
gen yr2007 = 0
replace yr2007 = 1 if tuyear == 2007
gen yr2008 = 0
replace yr2008 = 1 if tuyear == 2008
gen yr2009 = 0
replace yr2009 = 1 if tuyear == 2009
gen yr2010 = 0
replace yr2010 = 1 if tuyear == 2010
gen yr2011 = 0
replace yr2011 = 1 if tuyear == 2011
gen yr2012 = 0
replace yr2012 = 1 if tuyear == 2012
gen yr2013 = 0
replace yr2013 = 1 if tuyear == 2013
gen yr2014 = 0
replace yr2014 = 1 if tuyear == 2014
gen yr2015 = 0
replace yr2015 = 1 if tuyear == 2015
gen yr2016 = 0
replace yr2016 = 1 if tuyear == 2016
gen yr2017 = 0
replace yr2017 = 1 if tuyear == 2017
gen yr2018 = 0
replace yr2018 = 1 if tuyear == 2018
gen yr2019 = 0
replace yr2019 = 1 if tuyear == 2019
gen yr2020 = 0
replace yr2020 = 1 if tuyear == 2020
gen yr2021 = 0
replace yr2021 = 1 if tuyear == 2021
gen jan = 0
replace jan = 1 if tumonth == 1
gen feb = 0
replace feb = 1 if tumonth == 2
gen mar = 0
replace mar = 1 if tumonth == 3
gen apr = 0
replace apr = 1 if tumonth == 4
gen may = 0
replace may = 1 if tumonth == 5
gen jun = 0
replace jun = 1 if tumonth == 6
gen jul = 0
replace jul = 1 if tumonth == 7
gen aug = 0
replace aug = 1 if tumonth == 8
gen sep = 0
replace sep = 1 if tumonth == 9
gen oct = 0
replace oct = 1 if tumonth == 10
gen nov = 0
replace nov = 1 if tumonth == 11
gen dec = 0
replace dec = 1 if tumonth == 12
gen summer = 0
replace summer = 1 if (jun == 1 | jul == 1 | aug == 1)
gen employed = 0
replace employed = 1 if prempnot == 1
gen col_enroll = 0
replace col_enroll = 1 if (teschenr == 1 & teschlvl == 2)
gen unemployed = 0
replace unemployed = 1 if employed == 0
gen public = 0
replace public = 1 if (prdtcow1 == 7 | prdtcow1 == 8 | prdtcow1 == 9)
replace public = . if prdtcow1 < 5
gen private = 0
replace private = 1 if (prdtcow1 == 5 | prdtcow1 == 6)
replace private = . if prdtcow1 < 5
gen selfemployed = 0
replace selfemployed = 1 if prdtcow1 == 10
replace selfemployed = . if prdtcow1 < 5
gen unpaid = 0
replace unpaid = 1 if prdtcow1 == 11
replace unpaid = . if prdtcow1 < 5
gen fed = 0
replace fed = 1 if prdtcow1 == 7
gen state = 0
replace state = 1 if prdtcow1 == 8
gen locgov = 0
replace locgov = 1 if prdtcow1 == 9

save "respondentx0321.dta", replace

clear all
use "atussum0321.dta"
sort tucaseid tuyear
save "atussum0321.dta", replace
clear all
use "respondentx0321.dta"
merge 1:1 tucaseid tuyear using "atussum0321.dta"
drop _merge
recode teage (15/17 = 1 "15 to 17") (18/24 = 2 "18 to 24") (25/29 = 3 "25 to 29") (30/39 = 4 "30 to 39") (40/49 = 5 "40 to 49") (50/59 = 6 "50 to 59") (60/65 = 7 "60 to 65") (66/85 = 8 "66 to 85"), gen(agecat)
save "atusall0321.dta", replace

clear
cd "C:\\Datasets\ATUS\loneliness\data\stata\"