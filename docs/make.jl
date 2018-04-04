using DoubleFloats, Documenter

makedocs(
    modules = [DoubleFloats],
    clean = false,
    format = :html,
    sitename = "DoubleFloats.jl",
    authors = "Jeffrey Sarnoff, Simon Byrne, Sascha Timme, and other contributors",
    pages = [
        "Home" => "index.md",
        "Ahead" => "lookingahead.md",
        "Overview" => "appropriate.md",
        "Names" => "naming.md",
        "Predicates" => "predicates.md",
        "Refs" => "references.md"
    ],
)

deploydocs(
    repo = "github.com/JuliaMath/DoubleFloats.jl.git",
    julia = 0.7-
    target = "build",
    deps = Deps.pip("pygments", "mkdocs", "python-markdown-math"),
    make = nothing,
)

