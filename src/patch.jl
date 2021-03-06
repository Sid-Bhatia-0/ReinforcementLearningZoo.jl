# watch https://github.com/FluxML/Zygote.jl/pull/623

using Zygote

ignore(f) = f()
Zygote.@adjoint ignore(f) = ignore(f), _ -> nothing

using ReinforcementLearningCore

(app::NeuralNetworkApproximator)(args...; kwargs...) = app.model(args...; kwargs...)

using AbstractTrees
using TensorBoardLogger: TBLogger

AbstractTrees.children(t::StructTree{T}) where {T<:Union{TBLogger}} = ()
