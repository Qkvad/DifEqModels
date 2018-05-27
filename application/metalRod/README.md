# Application of Runge Kutta methods for solving ODE modeling thermic process of metal rod

Problem is given on: https://web.math.pmf.unizg.hr/~nela/zr2vjezbe/zr2_dif_jednadzbe.pdf

## Problem
![](problem.jpg?raw=true)

Strength of metal is controlled by its chemical composition and steps of mechanical design that were used to get it. After melted metal hardens, but before cooling completely, it is shaped into levers, plates or rods. Then, metal is left to cool and after it is subjected to carefully controlled changes of temperature in process called Thermic processing. 
Simple model of thermical processing is given by non-linear first order ODE for temperature of metal as function of time.
Steel is shaped into long rods which are heated so the stress gained during shaping is released. Rods are heated by letting the electricity through. After rods gain certain temperature, electricity is turned off and ventilators turn on to cool them. In both fases, heating and cooling, rods exchange heat with the environment by convection and radiation. Heat transfer by convection happend because of moving air around the rods and is modeled by equation
<p align="center"><img src="svgs/7748eecfd3161ea96b6f1750a6f171fb.svg?invert_in_darkmode" align=middle width=139.313955pt height=16.97751pt/></p>
where <p align="center"><img src="svgs/4ba08feb53feec4e905d8dd33a339882.svg?invert_in_darkmode" align=middle width=20.185769999999998pt height=14.3753115pt/></p> is power of cooling by convection, <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/be5babd58de2520c9f1c5ea96152f987.svg?invert_in_darkmode" align=middle width=14.943951pt height=11.190893999999998pt/></p> is empirical constant called coefficient of heat transfer, <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/3a1ff64c61566c76e350c5c3b3e45186.svg?invert_in_darkmode" align=middle width=19.033905pt height=15.885705pt/></p> is area of the rods cape, <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/c1d5631299f1af9861ff7a8dbee8b734.svg?invert_in_darkmode" align=middle width=11.844888pt height=11.190893999999998pt/></p> is temperature of the rod (assuming it is uniform) and <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/048e694ea9828356b3f448c5082c0795.svg?invert_in_darkmode" align=middle width=16.098357pt height=13.656621pt/></p> is the temperature of the air (environment). Heat transfer by radiation happens by means of electromagnetic waves in infrared spectrum. Rods exchange heat with any other surface in visible range. We assume that all of them have the temperature <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/048e694ea9828356b3f448c5082c0795.svg?invert_in_darkmode" align=middle width=16.098357pt height=13.656621pt/></p>.
In that case the model is
<p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/f94b405f090d27ff2cbd44071abf4282.svg?invert_in_darkmode" align=middle width=154.65334499999997pt height=18.869894999999996pt/></p>
<p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/3a89815aa8cb41e8d5ae9fcb76b64634.svg?invert_in_darkmode" align=middle width=19.673939999999998pt height=14.3753115pt/></p> is the power of cooling by radiation, <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/21d236a279f3526016d612501034819a.svg?invert_in_darkmode" align=middle width=6.647470499999999pt height=7.051176pt/></p> is the relative power of heat radiation that the rods area has <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/02812bed6494da122e07b9c576e12317.svg?invert_in_darkmode" align=middle width=72.312075pt height=16.376943pt/></p>, <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/daa2be317846f59d74ea5c5cf51eacab.svg?invert_in_darkmode" align=middle width=187.8756pt height=18.269295pt/></p> is Stefan-Boltzmanns constant.
Temperature in heat transfer by radiation has to be in <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/830e483e4c9aecf15ba41eb5180982dc.svg?invert_in_darkmode" align=middle width=22.637504999999997pt height=12.121164pt/></p>, it can be switched to <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/511bee02e6a31ff8ecef71d87fa7cf4a.svg?invert_in_darkmode" align=middle width=20.433435pt height=12.121164pt/></p> later. 
At each moment, the energy equilibrium is given by
<p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/c7d12f8fb8283891494a08d5822d49bf.svg?invert_in_darkmode" align=middle width=168.5277pt height=33.769394999999996pt/></p>,
where <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/a5d010ddf25320901476e98c67c1be6c.svg?invert_in_darkmode" align=middle width=5.9139135pt height=10.0731345pt/></p> is time, <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/5d55430569d9a949e663776910069118.svg?invert_in_darkmode" align=middle width=14.379172500000001pt height=7.051176pt/></p> is the mass of the rod, <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/3e4369eb5baad82d2fe6ee7c7d5c9e4a.svg?invert_in_darkmode" align=middle width=7.087228499999999pt height=7.051176pt/></p> is specific heat capacity and <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/5d1de20ab06533cc40530556fa0d50d2.svg?invert_in_darkmode" align=middle width=19.160459999999997pt height=14.3753115pt/></p> is power of heat generated by electricity. 
The ODE describing the model is 
<p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/967b9cf4974d2e6d003910f97e337d70.svg?invert_in_darkmode" align=middle width=371.6493pt height=33.769394999999996pt/></p>.
Since thermic processing is conducted in two phases:
	- heating by electricity is on and ventilators are off : heating (free convection)
	- heating is off and vectilators are on : cooling (forced convection)
we have the following situation
<p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/4e2f56101d03077949430d85e7bc5016.svg?invert_in_darkmode" align=middle width=151.207485pt height=39.30498pt/></p>
Where <p align="center"><img src="https://rawgit.com/Qkvad/DifEqModels/master/svgs/a44324a230ff3d52af3abb0b1113271b.svg?invert_in_darkmode" align=middle width=13.5811995pt height=12.5388615pt/></p> is the moment when heating is turned off and cooling is turned on. 




## Solution to the ODE of the problem
![](im1.jpg?raw=true)

To answer the question to which method (ode_rk23 or ode_rk4) is more accurate, I plot this image with doubling the subdivision for ode_rk4 to determine that the ode_rk23 is more accurate with half the points needed. 

![](im2.jpg?raw=true)
