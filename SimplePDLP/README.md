# MyPDLP

## Setup

All commands below assume that the current directory is the working directory.

A one-time step is required to set up the necessary packages on the local
machine:

```shell
$ julia --project -e 'import Pkg; Pkg.instantiate()'
```

## Running instances

```shell
$ julia --project script/run_problem.jl [directory_for_problem_instances] [results_directory] [problem_name]
```

## Plotting results

```shell
$ julia --project script/plot_result.jl [directory_for_solver_output] [figures_directory] [problem_name]
```

