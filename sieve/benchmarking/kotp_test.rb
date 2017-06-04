class Sieve
  attr_reader :primes
  def initialize(target)
    numbers = *(2..target)
    remove = ->(e) { numbers.delete e }
    filter = ->(prime) { (prime**2..target).step(prime) { |e| remove[e] } }
    sieve = ->(n) { n.each { |p| filter[p] } }
    @primes = sieve[numbers].compact
  end
end

require 'benchmark'

n = 1000

Benchmark.bmbm do |x|
  x.report("kotp:") { for i in 1..n; Sieve.new(n); end }
end
