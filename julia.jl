# ---- hello world ------------------------------------------------------

# hello.jl, run by:
$ julia hello.jl foo bar

println(PROGRAM_FILE, ": hello world!")
for arg in ARGS
	println(arg)
end

# or run this in command line:
$ julia -e 'println(PROGRAM_FILE); for arg in ARGS; println(arg); end' foo bar

# ---- naming -----------------------------------------------------------

# Unicode names (in UTF-8 encoding) are allowed:

julia> δ = 0.00001
1.0e-5

julia> 안녕하세요 = "Hello"
"Hello"

# α̂₂ can be entered by \alpha<tab>\hat<tab>\_2<tab>

# ---- redefine built-in objects ----------------------------------------

julia> pi = 3
3

julia> pi
3

julia> sqrt = 4
4

# if the built-in object is already in use, julia will give an error

julia> pi
π = 3.1415926535897...

julia> pi = 3
ERROR: cannot assign variable MathConstants.pi from module Main

julia> sqrt(100)
10.0

julia> sqrt = 4
ERROR: cannot assign variable Base.sqrt from module Main
