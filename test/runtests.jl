using Test, Aqua, LibAwsCommon

@testset "LibAwsCommon" begin
    @testset "aqua" begin
        Aqua.test_all(LibAwsCommon, ambiguities=false)
        Aqua.test_ambiguities(LibAwsCommon)
    end
    @testset "basic usage to test the library loads" begin
        allocator = aws_default_allocator()
        logpath = joinpath(mktempdir(), "log.txt")
        GC.@preserve logpath begin
            logger = Ref(aws_logger(C_NULL, C_NULL, C_NULL))
            logger_options = Ref(aws_logger_standard_options(AWS_LL_TRACE, Base.unsafe_convert(Ptr{Cchar}, logpath), C_NULL))
            aws_logger_init_standard(logger, allocator, logger_options)
            aws_logger_set(logger)
            aws_logger_clean_up(logger)
            @test isfile(logpath) # might as well check this but we're mainly testing we don't crash
        end
    end
end
