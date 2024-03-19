import delimited https://raw.githubusercontent.com/flynnecon/forecasting2024/main/usempldata_20240123.csv, clear
gen time=tm(1948m1) + _n-1
format time %tm
tsset time
*Date adjustements now for the season plots in q3 and q4
gen daytime = dofm(time)
format daytime %td
gen month = month(daytime)
gen year = year(daytime)

*Question 1
tsline usemplnsa, name("completeq1", replace)
*Question 2
tsline usemplnsa if time > tm(2000m12), name("since2001q2", replace)


separate usemplnsa, by(year)
twoway line usemplnsa**** month if year>=2006 & year <= 2012, legend(off) c(L) sy() name("seasplotq3", replace)
twoway line usemplnsa**** month if year>= 2019, legend(off) c(L) sy() name("seasplotq4",replace) 
