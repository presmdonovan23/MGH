# MGH
The metric for robustness and reliability of optimization software is often a suite of test functions, 
ranging from simple 2-dimensional problems to pathological functions, such as the Rosenbrock function.
The collection of 35 functions proposed in [1] has become widely used, with over 1750 citations. 
MATLAB implementations of these functions exist, but the operations are often not vectorized and thus 
are very inefficient. This package provides fully vectorized and highly efficient implementations of
34 of the functions.

[1] Moré, Jorge J., Burton S. Garbow, and Kenneth E. Hillstrom. "Testing unconstrained optimization software." <i>ACM Transactions on Mathematical Software (TOMS)</i> 7.1 (1981): 17-41.
