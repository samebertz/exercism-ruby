class Binary
  class << self
    def to_decimal(bitstring)
      raise ArgumentError if bitstring.index(/[^01]/)
      bits = bitstring.chars.each { |chr| chr.to_i }
      decimal = 0
      bits.reverse.reduce(0) do |power, bit|
        decimal += bit.to_i * 2**power
        power += 1
      end
      decimal
    end
  end
end

module BookKeeping
  VERSION = 3
end
