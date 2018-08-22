@testset "maxintfloat $T" for T in (Double16, Double32, Double64)
    @test isinteger(maxintfloat(T))

    # Test that the next integer is not representable, while the previous is.
    @test maxintfloat(T) != (maxintfloat(T) + one(T)) - one(T)
    @test maxintfloat(T) == (maxintfloat(T) - one(T)) + one(T)
end