cd "C:\\Datasets\ATUS\loneliness\"

use "data\atus_alone0321.dta"


qui reg trtalone i.tuyear##i.agecat [pweight=weight]
qui margins, over(tuyear agecat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)530) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By Age")
graph export "age.png", as(png) replace

qui reg trtalone i.tuyear##i.agecat2 [pweight=weight]
qui margins, over(tuyear agecat2)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)530) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By Age")
graph export "age_short.png", as(png) replace

qui reg trtalone i.tuyear##i.tesex [pweight=weight]
qui margins, over(tuyear tesex)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)530) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By Gender")
graph export "gender.png", as(png) replace

qui reg trtalone i.tuyear##i.tesex [pweight=weight] if agecat3 == 1
qui margins, over(tuyear tesex)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)390) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By Gender (29 or younger)")
graph export "gender_young.png", as(png) replace

qui reg trtalone i.tuyear##i.college_enrolled [pweight=weight] if agecat2 == 2 | agecat2 == 3
qui margins, over(tuyear college_enrolled)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)410) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By College-Going")
graph export "young_coll.png", as(png) replace

qui reg trtalone i.tuyear##i.college_enrolled [pweight=weight] if agecat2 == 2 | agecat2 == 3 & tesex == 1
qui margins, over(tuyear college_enrolled)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)410) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By College-Going Males")
graph export "young_coll_boys.png", as(png) replace

qui reg trtalone i.tuyear##i.college_enrolled [pweight=weight] if agecat2 == 2 | agecat2 == 3 & tesex == 2
qui margins, over(tuyear college_enrolled)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)410) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By College-Going Females")
graph export "young_coll_girls.png", as(png) replace

qui reg trtalone i.tuyear##i.inccat [pweight=weight] if agecat2 == 2 | agecat2 == 3 & college_enrolled == 1
qui margins, over(tuyear inccat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)410) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By HH Income (College Students)")
graph export "college_income.png", as(png) replace

qui reg trtalone i.tuyear##i.inccat [pweight=weight] if agecat3 == 1
qui margins, over(tuyear inccat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)390) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By HH Income (29 or younger)")
graph export "income_young.png", as(png) replace

qui reg trtalone i.tuyear##i.inccat [pweight=weight] if agecat == 1
qui margins, over(tuyear inccat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)390) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By HH Income (17 or younger)")
graph export "income_teens.png", as(png) replace

qui reg trtalone i.tuyear##i.educ_cat [pweight=weight] if agecat3 == 2 | agecat3 == 3
qui margins, over(tuyear educ_cat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)410) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By Education (30+ year-olds)")
graph export "adults_edu.png", as(png) replace

qui reg trtalone i.tuyear##i.inccat [pweight=weight] if agecat3 == 2 | agecat3 == 3
qui margins, over(tuyear inccat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)540) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By Income (30+ year-olds)")
graph export "adults_inc.png", as(png) replace

qui reg trtalone i.tuyear##i.tesex [pweight=weight] if agecat3 == 2
qui margins, over(tuyear tesex)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)390) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By Gender (30-49 year-olds)")
graph export "middle_gender.png", as(png) replace

qui reg trtalone i.tuyear##i.marrcat [pweight=weight] if agecat3 == 2
qui margins, over(tuyear marrcat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)390) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By Marital Status (30-49 year-olds)")
graph export "middle_marr.png", as(png) replace

qui reg trtalone i.tuyear##i.marrcat [pweight=weight] if agecat3 == 2 & tesex == 1
qui margins, over(tuyear marrcat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)390) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By Marital Status (30-49 year-olds, Men)")
graph export "middle_marr_men.png", as(png) replace

qui reg trtalone i.tuyear##i.marrcat [pweight=weight] if agecat3 == 2 & tesex == 2
qui margins, over(tuyear marrcat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)390) ytitle("Minutes") xtitle("Year") title("Time Spent Alone Per Day By Marital Status (30-49 year-olds, Women)")
graph export "middle_marr_women.png", as(png) replace
*/

**Friend time

qui reg trtfriend i.tuyear##i.agecat [pweight=weight]
qui margins, over(tuyear agecat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)210) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Age")
graph export "friend\age.png", as(png) replace

qui reg trtfriend i.tuyear##i.agecat2 [pweight=weight]
qui margins, over(tuyear agecat2)
marginsplot, noci xlabel(, angle(45)) ylabel(0(30)210) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Age")
graph export "friend\age_short.png", as(png) replace

qui reg trtfriend i.tuyear##i.tesex [pweight=weight]
qui margins, over(tuyear tesex)
marginsplot, noci xlabel(, angle(45)) ylabel(0(20)80) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Gender")
graph export "friend\gender.png", as(png) replace

qui reg trtfriend i.tuyear##i.tesex [pweight=weight] if agecat3 == 1
qui margins, over(tuyear tesex)
marginsplot, noci xlabel(, angle(45)) ylabel(0(20)140) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Gender (29 or younger)")
graph export "friend\gender_young.png", as(png) replace

qui reg trtfriend i.tuyear##i.college_enrolled [pweight=weight] if agecat2 == 2 | agecat2 == 3
qui margins, over(tuyear college_enrolled)
marginsplot, noci xlabel(, angle(45)) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By College-Going")
graph export "friend\young_coll.png", as(png) replace

qui reg trtfriend i.tuyear##i.college_enrolled [pweight=weight] if agecat2 == 2 | agecat2 == 3 & tesex == 1
qui margins, over(tuyear college_enrolled)
marginsplot, noci xlabel(, angle(45)) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By College-Going Males")
graph export "friend\young_coll_boys.png", as(png) replace

qui reg trtfriend i.tuyear##i.college_enrolled [pweight=weight] if agecat2 == 2 | agecat2 == 3 & tesex == 2
qui margins, over(tuyear college_enrolled)
marginsplot, noci xlabel(, angle(45)) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By College-Going Females")
graph export "friend\young_coll_girls.png", as(png) replace

qui reg trtfriend i.tuyear##i.inccat [pweight=weight] if agecat2 == 2 | agecat2 == 3 & college_enrolled == 1
qui margins, over(tuyear inccat)
marginsplot, noci xlabel(, angle(45)) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By HH Income (College Students)")
graph export "friend\college_income.png", as(png) replace

qui reg trtfriend i.tuyear##i.inccat [pweight=weight] if agecat3 == 1
qui margins, over(tuyear inccat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(10)50) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By HH Income (29 or younger)")
graph export "friend\income_young.png", as(png) replace

qui reg trtfriend i.tuyear##i.inccat [pweight=weight] if agecat == 1
qui margins, over(tuyear inccat)
marginsplot, noci xlabel(, angle(45)) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By HH Income (17 or younger)")
graph export "friend\income_teens.png", as(png) replace

qui reg trtfriend i.tuyear##i.educ_cat [pweight=weight] if agecat3 == 2 | agecat3 == 3
qui margins, over(tuyear educ_cat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(10)50) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Education (30+ year-olds)")
graph export "friend\adults_edu.png", as(png) replace

qui reg trtfriend i.tuyear##i.inccat [pweight=weight] if agecat3 == 2 | agecat3 == 3
qui margins, over(tuyear inccat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(10)50) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Income (30+ year-olds)")
graph export "friend\adults_inc.png", as(png) replace

qui reg trtfriend i.tuyear##i.tesex [pweight=weight] if agecat3 == 2
qui margins, over(tuyear tesex)
marginsplot, noci xlabel(, angle(45)) ylabel(0(10)50) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Gender (30-49 year-olds)")
graph export "friend\middle_gender.png", as(png) replace

qui reg trtfriend i.tuyear##i.marrcat [pweight=weight] if agecat3 == 2
qui margins, over(tuyear marrcat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(20)100) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Marital Status (30-49 year-olds)")
graph export "friend\middle_marr.png", as(png) replace

qui reg trtfriend i.tuyear##i.marrcat [pweight=weight] if agecat3 == 2 & tesex == 1
qui margins, over(tuyear marrcat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(20)100) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Marital Status (30-49 year-olds, Men)")
graph export "friend\middle_marr_men.png", as(png) replace

qui reg trtfriend i.tuyear##i.marrcat [pweight=weight] if agecat3 == 2 & tesex == 2
qui margins, over(tuyear marrcat)
marginsplot, noci xlabel(, angle(45)) ylabel(0(20)100) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Marital Status (30-49 year-olds, Women)")
graph export "friend\middle_marr_women.png", as(png) replace

qui reg trtfriend i.tuyear##i.racecat2 [pweight=weight] if agecat3 == 2
qui margins, over(tuyear racecat2)
marginsplot, noci xlabel(, angle(45)) ytitle("Minutes") xtitle("Year") title("Time Spent With Friends Per Day By Race (30-49 year-olds)")
graph export "friend\middle_race.png", as(png) replace

clear

cd "C:\\Datasets\ATUS\loneliness\"