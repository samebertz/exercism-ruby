module PatchArrayStrain
  refine Array do
    def keep
      reduce([]) { |memo, obj| memo << obj if yield(obj); memo }
    end
    def discard(&b)
      self - keep(&b)
    end
  end
end

# NOTE: refinement requires `using PatchArrayStrain` at top of strain_test.rb
