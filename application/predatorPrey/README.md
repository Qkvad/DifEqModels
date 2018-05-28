

We are looking into the dinamic of populations of two connected animal spieces: 
- prey (rabbit) is the primary food source for other spieces
- predator (wolf) 

Let p<sub>1</sub>(t) be the population of the prey and p<sub>2</sub>(t) be the population of the predator. Rate of increase of both populations can be modeled by these ODEs

<p align="center"><img src="svgs/975b5349e4aac5528ed0ba6810d8b8f4.svg" align=middle width=146.586825pt height=33.769394999999996pt/></p>
<p align="center"><img src="svgs/e008f70637d140b097a04dc03361456c.svg" align=middle width=146.586825pt height=33.769394999999996pt/></p>

where 
- α<sub>1<\sub> and α<sub>2<\sub> are the coefficients for rate of increase,
- δ<sub>1<\sub> and δ<sub>2<\sub> are rate of mortality.

### 1<sup>st<\sup> equation

- expression α<sub>1<\sub>p<sub>1<\sub> describes the fertility of the prey for which is assumed that it depends only on avaliability of the partner
- it is assumed that prey always have enough food required
- expression δ<sub>1<\sub>p<sub>1<\sub>p<sub>2<\sub> is mortality rate of the prey, it is increased by the increase of the population of predators (cause they eat them) and the increase of the prey population itself
- coefficient δ<sub>1<\sub> stands for the efficiency in predators hunting 

### 2<sup>nd<\sup> equation

- predators are reproduced depending on their number, but their reproduction is limited by the food avaliability (p<sub>1<\sub>)
- coefficient α<sub>2<\sub> describes fertility of the predators, but also the nutritional value of the prey
- mortality of the predators is increasing with the increase of predators population (food is spent faster)

### Initial conditions

- p<sub>1<\sub>(0), p<sub>2<\sub>(0), α<sub>1<\sub>, α<sub>2<\sub>, δ<sub>1<\sub> and δ<sub>2<\sub> have to come from biological studies

### Code

- ode_rk4v ... vectorized version of Runge-Kutta 4 method for solving system of m ODEs
- ode_rk23 ... vectorized version of RK23 mothod -||-

- y0 is m dimensional vector with m initial conditions for each equation
- y is mx(n+1) matrix with i-th column y(1:m,i)=y(x(i))
- prey_pred_f(t,p) is the implementation of the right sides of SODE and it returns  column vector of the elements dp1/dt and dp2/dt

### Parameters

- α<sub>1<\sub> = 2
- α<sub>2<\sub> = 0.0002
- δ<sub>1<\sub> = 0.02
- δ<sub>2<\sub> = 0.8
- p<sub>1<\sub>(0) = 5000
- p<sub>2<\sub>(0) = 100
- n = 300
- tol = 10<sup>-2<\sup>
