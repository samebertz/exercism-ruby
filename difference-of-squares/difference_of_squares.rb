class Squares
  def initialize(n)
    @n = n
  end
  def square_of_sum
    (@n*(@n+1) / 2.0)**2
  end
  def sum_of_squares
    (2*@n**3 + 3*@n**2 + @n) / 6.0
  end
  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end
