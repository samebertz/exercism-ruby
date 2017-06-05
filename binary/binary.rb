class Binary
  class << self
    def to_decimal(bitstring)
      raise ArgumentError if bitstring.index(/[^01]/)
      bitstring.chars.reverse.each.with_index.reduce(0) do |n, (b, i)|
        n += b.to_i*(2**i)
      end
      # bitstring.to_i(2)
    end
  end
end

module BookKeeping
  VERSION = 3
end
