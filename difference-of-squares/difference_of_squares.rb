class Squares
  def initialize(n)
    @n = n
  end
  def square_of_sum
    begin Array.new(@n){|i| i+1}.reduce(:+) ** 2 rescue 0 end
  end
  def sum_of_squares
    begin Array.new(@n){|i| (i+1)**2}.reduce(:+) + 0 rescue 0 end
  end
  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end
