class Series
  def initialize(digits)
    @digits = digits
  end
  def slices(n)
    raise ArgumentError if n > @digits.length
    slices = []
    for i in 0 .. @digits.length - n do
      slices << @digits[i ... i + n]
    end
    slices
  end
end
