module BenchmarkModule
  class Framework
    attr_accessor :blocks
    def initialize(blocks = {})
      @blocks = blocks
    end
    def add_method(block_name, &block)
      @blocks[block_name] = block
    end
    def clear_methods
      @blocks.clear
    end
    def use_method(block_name, *args)
      result = instance_exec(*args, &@blocks[block_name])
    end
  end

  TESTS = 1_000

  class Measure
    require "benchmark"
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
