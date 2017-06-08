class Series
  def initialize(digits)
    @digits = digits
  end
  def slices(n)
    raise ArgumentError if n > @digits.length
    @digits[0..-n].chars.each.with_index.reduce([]) do |memo, (obj, i)|
      memo << @digits[i...i+n]
    end
  end
end
