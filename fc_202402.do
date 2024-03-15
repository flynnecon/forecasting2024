*Forecast model for us employment (nsa) for February release. 

import delimited https://raw.githubusercontent.com/flynnecon/forecasting2024/main/emp-202401.csv, clear
gen time = tm(2014Jan) + _n-1
format time %tm
tsset time
tsappend, add(12)

*Model 1 for forecast
ucm emplnsa, model(rtrend) seasonal(12)
estimates store model1
predict fc1
predict fc2, dynamic(tm(2024m1))

*Model 2 for forecast
*This model fails to converge, at least when I run it. I let it go for nearly 300 iterations with little change in convergence criteria. This is a sign of a model that might not be running appropriately. 
ucm emplnsa, model(strend) seasonal(12)
estimates store model2
predict fc3
predict fc4, dynamic(tm(2024m1))

*Test for a unit root
dfuller emplnsa
*Find out there is a minor concern about unit root issues.
ucmemplnsa, model(strend) seasonal(12)
estimates store model3
predict fc5, dynamic(tm(2024m1))

