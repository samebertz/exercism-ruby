class Sieve
  # attr_accessor :primes
  # def initialize(n)
  #   (@primes=[*(2..n)])[0..n**0.5-2].map{|e|@primes-=(e**2..n).step(e).to_a}
  # end
  # attr_reader :primes
  # def initialize(target)
  #   numbers = *(2..target)
  #   remove = ->(e) { numbers.delete e }
  #   filter = ->(prime) { (prime**2..target).step(prime) { |e| remove[e] } }
  #   sieve = ->(n) { n.each { |p| filter[p] } }
  #   @primes = sieve[numbers].compact
  # end
  attr_reader :primes
  def initialize(target)
    numbers = [*(2..target)]
    sieve = ->(prime) { numbers -= (prime**2..target).step(prime).to_a }
    numbers[0..target**0.5-2].each{|p| sieve[p]}
    @primes = numbers
  end
end

module BookKeeping
  VERSION = 1
end
