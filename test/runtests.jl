using Test, Aqua, LibAwsIO, LibAwsCommon

@testset "LibAwsIO" begin
    @testset "aqua" begin
        Aqua.test_all(LibAwsIO, ambiguities=false)
        Aqua.test_ambiguities(LibAwsIO)
    end
    @testset "basic usage to test the library loads" begin
        alloc = aws_default_allocator() # important! this shouldn't need to be qualified! if we generate a definition for it in LibAwsIO that is a bug.
        LibAwsIO.init(alloc)
        cb = default_aws_client_bootstrap()
        @test cb != C_NULL
    end
end
