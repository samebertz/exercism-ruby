class Sieve
  attr_reader :primes
  def initialize(target)
    numbers = [*(2..target)]
    sieve = ->(prime) { numbers -= (prime**2..target).step(prime).to_a }
    numbers[0..target**0.5-2].each{|p| sieve[p]}
    @primes = numbers
  end
end

require 'benchmark'

n = 1000

Benchmark.bmbm do |x|
  x.report("hybrid:") { for i in 1..n; Sieve.new(n); end }
end
