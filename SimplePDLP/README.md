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

