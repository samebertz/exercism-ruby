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
end
