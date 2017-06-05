module PatchArrayAccumulate
  refine Array do
    def accumulate
      return to_enum(:map) if !block_given?
      result = []
      each do |e|
        result << yield(e)
      end
      result
    end
  end
end

# NOTE: refinement requires `using PatchArrayAccumulate` at top of accumulate_test.rb

module BookKeeping
  VERSION = 1
end
