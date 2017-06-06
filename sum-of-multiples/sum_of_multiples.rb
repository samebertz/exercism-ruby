class SumOfMultiples
  attr_reader :factors, :multiples
  def initialize(*factors)
    @factors = factors.sort
    @multiples = []
    @i = 0
  end
  def to(n)
    while @i * @factors[0] < n
      @factors.each { |e| @multiples << e * @i }
      @i += 1
    end
    (@multiples & [*(0...n)]).reduce(0,:+)
  end
end
