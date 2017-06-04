class Sieve
  attr_reader :primes
  def initialize(target)
    numbers = [*(2..target)]
    filter = ->(prime) { numbers -= (prime**2..target).step(prime).to_a }
    sieve = ->(n) { n.each { |p| filter[p] } }
    sieve[numbers[0..target**0.5-2]]
    @primes = numbers
  end
  # def initialize(target)
  #   numbers = [*(2..target)]
  #   sieve = ->(prime) { numbers -= (prime**2..target).step(prime).to_a }
  #   numbers[0..target**0.5-2].each{|p| sieve[p]}
  #   @primes = numbers
  # end
end

require 'benchmark'

n = 1000

Benchmark.bmbm do |x|
  x.report("kotp:") { for i in 1..n; Sieve.new(n); end }
end
