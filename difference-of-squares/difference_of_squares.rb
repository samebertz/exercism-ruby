class Squares
  def initialize(n)
    @n = n
  end
  def square_of_sum
    [*(0...@n)].map{|i| i+1}.reduce(:+) ** 2 rescue 0
  end
  def sum_of_squares
    [*(0...@n)].map{|i| (i+1)**2}.reduce(:+) + 0 rescue 0
  end
  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end
