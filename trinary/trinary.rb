class Trinary
  def initialize(tritstring)
    raise ArgumentError if tritstring.index(/[^012]/)
    @trits = tritstring.chars.each { |chr| chr.to_i }
  end
  def to_decimal
    @trits.reverse.reduce([0,0]) do |(decimal, power), trit|
      [decimal += trit.to_i * 3**power, power += 1]
    end[0]
  end
end

module BookKeeping
  VERSION = 1
end
