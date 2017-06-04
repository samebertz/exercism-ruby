class Grains
  @@total = Array.new(64).fill(2).reduce(1,:*)-1
  def self.square(n)
    raise ArgumentError unless n.between?(1,64)
    2**(n-1)
  end
  def self.total
    @@total
  end
end

module BookKeeping
  VERSION = 1
end
