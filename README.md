# PathFinder

The purpose of this program is to simulate the autonomous part of a robot at a minimalist level using interpolation methods. 
We consider that the robot is on a two-dimensional, flat terrain and needs to discover a trajectory that passes through a set of points. 
For this, we use the methods: Vandermonde and natural cubic splines.

### Natural Cubic Splines:

* Mathematically: Interpolation with natural cubic splines involves constructing a spline function made of cubic polynomials between each pair of adjacent points, ensuring that the spline function and its first two derivatives are continuous at each interpolation point. 
The system of equations for cubic splines can be solved to find the coefficients of the cubic polynomials.
* Physically: Natural cubic splines provide a smooth and natural trajectory without excessive oscillations, as they impose continuity and smoothness conditions at each interpolation point. They are preferred in practical applications due to their stability and the quality of the results obtained.

### Vandermonde:

* Mathematically: It transforms the interpolation problem into a system of linear equations that, once solved, provides the coefficients of a unique polynomial that passes through all specified points. To apply this method, a matrix called the Vandermonde matrix is constructed. This matrix is formed from the x_i values of the interpolation points. Each row of the matrix contains the increasing powers of each x_i, from 0 to n, where n is the number of points minus one.
* Physically: While it is exact for small sets of points, it can become unstable and susceptible to numerical errors for large sets of points.
