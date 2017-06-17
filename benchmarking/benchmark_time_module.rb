require "benchmark"
require_relative "benchmark_framework_module"
module BenchmarkModule
  TESTS = 1_000
  class Measure
    def initialize(blocks)
      @blocks = blocks
      @framework = Framework.new(blocks)
    end

    def time_method(block_name, args=[], tests=TESTS)
      time = {
        block_name => Benchmark.measure(block_name) do
          for i in 0..tests
            @framework.use_method(block_name, args)
          end
        end
      }
    end

    def time_all(args=[], tests=TESTS)
      times = {}
      @blocks.each_key do |block_name|
        times[block_name] = Benchmark.measure(block_name) do
          for i in 0..tests
            @framework.use_method(block_name, args)
          end
        end
      end
      times
    end
  end
end
