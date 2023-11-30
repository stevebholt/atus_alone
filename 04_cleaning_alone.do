cd "C:\\Datasets\ATUS\loneliness\"

use "data\atusall0321.dta"

recode agecat (1 = 1 "15 to 17") (2=2 "18 to 24") (3=3 "25 to 29") (4=4 "30 to 39") (5/8 = 5 "40+"), gen(agecat2)
recode pemaritl (1/2 = 1 "Married") (4/5 = 2 "Separated/Divorced") (6 = 3 "Never married") (-1 = .), gen(marrcat)
recode racecat (1=1 "White") (2/6 = 2 "Non-White"), gen(racecat2)
replace racecat = . if racecat == -1
replace racecat2 = . if racecat2 == -1
replace racecat2 = 2 if racecat2 == 1 & hisp == 1
recode agecat (1/3 = 1 "15 to 29") (4/5 = 2 "30 to 49") (6/8 = 3 "50+"), gen(agecat3)
gen college_enrolled = 0
replace college_enrolled = 1 if teschlvl == 2
label define colenr 0 "Not enrolled" 1 "Enrolled"
label val college_enrolled colenr
gen educ_cat = .
replace educ_cat = 1 if nohsdip == 1 | hsdip == 1
replace educ_cat = 2 if somcol == 1
replace educ_cat = 3 if coldeg == 1
label define educ_cat 1 "HS or less" 2 "Some college" 3 "4-year degree+"
label val educ_cat educ_cat
gen inccat = .
replace inccat = 1 if loinc == 1
replace inccat = 2 if inc2040 == 1 | inc4060 == 1
replace inccat = 3 if inc6075 == 1 | inc75100 == 1
replace inccat = 4 if inc100150 == 1 | inc150p == 1
label define inccat 1 "<$20K" 2 "$20K-$60K" 3 "$60K-$100K" 4 ">$100K"
label val inccat inccat
gen weight = tufnwgtp if tuyear != 2020
replace weight = tu20fwgt if tuyear == 2020

save "data\atus_alone0321.dta"

clear

cd "C:\\Datasets\ATUS\loneliness\"