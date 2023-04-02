include("../src/SimplePDLP.jl")

@assert length(ARGS) == 4
problem_folder = ARGS[1]
output_directory = ARGS[2]
problem_name = ARGS[3]
kkt_tolerance = ARGS[4]

function main()
    kkt_tolerance = parse(Float64, ARGS[4])
    instance_path = joinpath("$(problem_folder)", "$(problem_name).mps.gz")
    lp = qps_reader_to_standard_form(instance_path)
    m,n = size(lp.constraint_matrix)
    
    solver_output = solve(lp, 20000, kkt_tolerance, zeros(n), zeros(m))
    JLD2.jldsave(joinpath("$(output_directory)","$(problem_name).jld2"); solver_output)
end

main()


