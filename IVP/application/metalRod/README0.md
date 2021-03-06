# Application of Runge Kutta methods for solving ODE modeling thermic process of metal rod

Problem is given on: https://web.math.pmf.unizg.hr/~nela/zr2vjezbe/zr2_dif_jednadzbe.pdf

## Problem
![](problem.jpg?raw=true)

Strength of metal is controlled by its chemical composition and steps of mechanical design that were used to get it. After melted metal hardens, but before cooling completely, it is shaped into levers, plates or rods. Then, metal is left to cool and after it is subjected to carefully controlled changes of temperature in process called Thermic processing. 
Simple model of thermical processing is given by non-linear first order ODE for temperature of metal as function of time.
Steel is shaped into long rods which are heated so the stress gained during shaping is released. Rods are heated by letting the electricity through. After rods gain certain temperature, electricity is turned off and ventilators turn on to cool them. In both fases, heating and cooling, rods exchange heat with the environment by convection and radiation. Heat transfer by convection happend because of moving air around the rods and is modeled by equation
$$\[Q_{k} = HA_{p}(T-T_{0})\]$$
where $Q_{k}$ is power of cooling by convection, $H$ is empirical constant called coefficient of heat transfer, $A_{p}$ is area of the rods cape, $T$ is temperature of the rod (assuming it is uniform) and $T_{0}$ is the temperature of the air (environment). Heat transfer by radiation happens by means of electromagnetic waves in infrared spectrum. Rods exchange heat with any other surface in visible range. We assume that all of them have the temperature $T_{0}$.
In that case the model is
$$\[Q_{z} = \epsilon \sigma A_{p} (T^4 - T_{0}^4),\]$$
$Q_{z}$ is the power of cooling by radiation, $\epsilon$ is the relative power of heat radiation that the rods area has $(\epsilon \in \left [ 0,1 \right ])$, $\sigma = 5.67 \cdot 10^{-8} W/(m^2 K^4)$ is Stefan-Boltzmanns constant.
Temperature in heat transfer by radiation has to be in $^{\circ}K$, it can be switched to $^{\circ}C$ later. 
At each moment, the energy equilibrium is given by
$$\[mc \frac{dT}{dt} = Q_{e} - Q_{k} -Q_{z}\]$$,
where $t$ is time, $m$ is the mass of the rod, $c$ is specific heat capacity and $Q_{e}$ is power of heat generated by electricity. 
The ODE describing the model is 
$$\[\frac{dT}{dt}= \frac{1}{mc} \left \{ Q_{e}-A_{p}\left [ H(t)(T-T_{0})+\epsilon \sigma (T^4 - T_{0}^4) \right ] \right \}\]$$.
Since thermic processing is conducted in two phases:
	- heating by electricity is on and ventilators are off : heating (free convection)
	- heating is off and vectilators are on : cooling (forced convection)
we have the following situation
$$\[H(t)=\left\{\begin{matrix}
H_1, & t < t_h \\ 
H_2, & t\geq t_h
\end{matrix}\right.\]$$
Where $t_h$ is the moment when heating is turned off and cooling is turned on. 




## Solution to the ODE of the problem
![](im1.jpg?raw=true)

To answer the question to which method (ode_rk23 or ode_rk4) is more accurate, I plot this image with doubling the subdivision for ode_rk4 to determine that the ode_rk23 is more accurate with half the points needed. 

![](im2.jpg?raw=true)
