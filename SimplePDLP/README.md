# SimplePDLP

HISTORY Forked from https://github.com/google-research/FirstOrderLp.jl which originally stated Apache-2.0 as its license.

This directory is intended exclusively for teaching purpose to illustrate how to design and implement a solver in Julia using an example of PDHG for LP.  The implementation may not be computationally efficient, but rather include most of the basic components of a first-order method LP solver. A more sophisticated Julia implementation of the algorithm can be found at [FirstOrderLp.jl](https://github.com/google-research/FirstOrderLp.jl), and a more efficient C++ implementation of the algorithm is included in [OR-Tools](https://github.com/google/or-tools).


## Setup

All commands below assume that the current directory is the working directory.

A one-time step is required to set up the necessary packages on the local

machine:

```shell
$ julia --project -e 'import Pkg; Pkg.instantiate()'
```

## Running instances

```shell
$ julia --project script/run_problem.jl [directory_for_problem_instances] [results_directory] [problem_name] [KKT_tolerance] [iteration_limit]
```

## Plotting results

```shell
$ julia --project script/plot_result.jl [directory_for_solver_output] [figure_directory] [problem_name]
```

## Example

```shell
$ julia --project script/run_problem.jl --problem_folder=./data --output_directory=./output/solver_output --problem_name=neos5 --kkt_tolerance=1e-6 --iteration_limit=20000
$ julia --project script/plot_result.jl --directory_for_solver_output=./output/solver_output --figure_directory=./output/figure --problem_name=neos5
```

## JuMP interface
HISTORY Forked from https://github.com/Shuvomoy/SimplePDHG.jl and [discourse link](https://discourse.julialang.org/t/connecting-a-simple-first-order-solver-to-solve-standard-form-linear-program-to-jump/95694).

```julia
# data 
A = [1 1 9 5; 3 5 0 8; 2 0 6 13]
b = [7, 3, 5]
c = [1, 3, 5, 2]
m, n = size(A)
G = [0.5012005468024234 -1.5806753104910911 1.1908183108070869 1.6527613262371468; -1.7596263752677483 -0.5235246034519885 0.4618550523688477 0.4871842582808355; -0.6305269735894394 0.023788955821653315 -0.5208935392017503 -1.667410808905106; 1.02249016425841 0.6890017766482583 1.2904648745012357 1.398062622113161; -0.9763001854265912 0.866180139889124 -0.18426778358700338 1.1436405988912726; 0.4004591856282607 -0.6315453522080423 -0.32707956849441 -1.192277331736516];
h = 2*ones(2*m)

# JuMP code
using JuMP
include("./src/SimplePDLP.jl")
model =  Model(Optimizer)
@variable(model, x[1:n] >= 0)
@objective(model, Min, c'*x)
@constraint(model, A*x .== b)
@constraint(model, G*x .<= h)
optimize!(model)
println("Objective value: ", objective_value(model))
println("x = ", value.(x))
x_star = value.(x)
```

