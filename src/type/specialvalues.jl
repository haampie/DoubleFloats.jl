zero(::Type{DoubleFloat{T}}) where {T<:AbstractFloat} = DoubleFloat(zero(T), zero(T))
one(::Type{DoubleFloat{T}}) where {T<:AbstractFloat} = DoubleFloat(one(T), zero(T))

nan(::Type{DoubleFloat{T}}) where {T<:AbstractFloat} = DoubleFloat(T(NaN), T(NaN))
inf(::Type{DoubleFloat{T}}) where {T<:AbstractFloat} = DoubleFloat(T(Inf), T(NaN))
posinf(::Type{DoubleFloat{T}}) where {T<:AbstractFloat} = DoubleFloat(T(Inf), T(NaN))
neginf(::Type{DoubleFloat{T}}) where {T<:AbstractFloat} = DoubleFloat(T(-Inf), T(NaN))

typemax(::Type{DoubleFloat{T}}) where {T<:AbstractFloat} = DoubleFloat{T}(typemax(T))
typemin(::Type{DoubleFloat{T}}) where {T<:AbstractFloat} = DoubleFloat{T}(typemin(T))

floatmax(::Type{DoubleFloat{T}}) where {T<:AbstractFloat} = DoubleFloat{T}(floatmax(T))
floatmin(::Type{DoubleFloat{T}}) where {T<:AbstractFloat} = DoubleFloat{T}(floatmin(T))

maxintfloat(::Type{DoubleFloat{Float64}}) = DoubleFloat{Float64}(ldexp(0.5, 108), ldexp(0.5, 54))
maxintfloat(::Type{DoubleFloat{Float32}}) = DoubleFloat{Float32}(ldexp(0.5f0, 50), ldexp(0.5f0, 25))
maxintfloat(::Type{DoubleFloat{Float16}}) = DoubleFloat{Float16}(ldexp(Float16(0.9995),16), ldexp(Float16(0.5),5)-2)

isnan(x::DoubleFloat{T}) where {T<:IEEEFloat} = isnan(HI(x))
isinf(x::DoubleFloat{T}) where {T<:IEEEFloat} = (HI(x) === T(Inf))
isposinf(x::DoubleFloat{T}) where {T<:IEEEFloat} = (HI(x) === T(Inf))
isneginf(x::DoubleFloat{T}) where {T<:IEEEFloat} = (HI(x) === T(-Inf))


zero(::Type{DoubleFloat{DoubleFloat{T}}}) where {T<:AbstractFloat} = DoubleFloat(DoubleFloat(zero(T)), DoubleFloat(zero(T)))
one(::Type{DoubleFloat{DoubleFloat{T}}}) where {T<:AbstractFloat} = DoubleFloat(DoubleFloat(one(T)), DoubleFloat(zero(T)))

nan(::Type{DoubleFloat{DoubleFloat{T}}}) where {T<:AbstractFloat} = DoubleFloat(nan(DoubleFloat{T}), nan(DoubleFloat{T}))
inf(::Type{DoubleFloat{DoubleFloat{T}}}) where {T<:AbstractFloat} = DoubleFloat(inf(DoubleFloat{T}), zero(DoubleFloat{T}))
posinf(::Type{DoubleFloat{DoubleFloat{T}}}) where {T<:AbstractFloat} = DoubleFloat(posinf(DoubleFloat{T}), zero(DoubleFloat{T}))
neginf(::Type{DoubleFloat{DoubleFloat{T}}}) where {T<:AbstractFloat} = DoubleFloat(neginf(DoubleFloat{T}), zero(DoubleFloat{T}))


isnan(x::DoubleFloat{DoubleFloat{T}}) where {T<:IEEEFloat} = (HI(HI(x)) === T(NaN))
isinf(x::DoubleFloat{DoubleFloat{T}}) where {T<:IEEEFloat} = (HI(HI(x)) === T(Inf))
isposinf(x::DoubleFloat{DoubleFloat{T}}) where {T<:IEEEFloat} = (HI(HI(x)) === T(Inf))
isneginf(x::DoubleFloat{DoubleFloat{T}}) where {T<:IEEEFloat} = (HI(HI(x)) === T(-Inf))
