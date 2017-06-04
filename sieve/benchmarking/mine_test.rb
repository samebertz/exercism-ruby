class Sieve
  attr_accessor :primes
  def initialize(n)
    (@primes=[*(2..n)])[0..n**0.5-2].map{|e|@primes-=(e**2..n).step(e).to_a}
  end
end

require 'benchmark'

n = 1000

Benchmark.bmbm do |x|
  x.report("kotp:") { for i in 1..n; Sieve.new(n); end }
end
