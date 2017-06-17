require_relative "benchmark_framework_module"
include BenchmarkFrameworkModule

require "benchmark"

module BenchmarkTimeModule
  TESTS = 1_000

  class BenchmarkTime
    def initialize(blocks)
      @@blocks = blocks
      BenchmarkFramework.set_methods(blocks)
    end

    def time_method(block_name, args=[], tests=TESTS)
      time = {
        block_name => Benchmark.measure(block_name) do
          for i in 0..tests
            BenchmarkFramework.use_method(block_name, args)
          end
        end
      }
    end

    def time_all(tests=TESTS, *args)
      times = {}
      @@blocks.each_key do |block_name|
        times[block_name] = Benchmark.measure(block_name) do
          for i in 0..tests
            BenchmarkFramework.use_method(block_name, args)
          end
        end
      end
      times
    end
  end
end
