import Plots
import JLD2
include("../src/SimplePDLP.jl")

@assert length(ARGS) == 3
result_folder = ARGS[1]
figure_directory = ARGS[2]
problem_name = ARGS[3]

function main()
    solver_output = JLD2.load(joinpath("$(result_folder)", "$(problem_name).jld2"))
    solver_output = solver_output["solver_output"]
    
    kkt_error = solver_output.iteration_stats[:,"kkt_error"]
    
    kkt_plt = Plots.plot()
    
    Plots.plot!(
        1:5:(5*length(kkt_error)),
        kkt_error,
        linewidth=1,
        #color = "green",
        #legend = :topright,
        xlabel = "iterations",
        ylabel = "KKT residual",
        #xaxis=:log,
        xguidefontsize=12,
        yaxis=:log,
        yguidefontsize=12,
        label=problem_name
    )
    
    Plots.savefig(kkt_plt,joinpath("$(figure_directory)", "$(problem_name).png")) 
end

main()
