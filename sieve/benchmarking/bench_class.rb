class Sieve1
  def initialize(n)
    (primes=[*(2..n)])[0..n**0.5-2].map{|e|primes-=(e**2..n).step(e).to_a}[-1]
  end
end

class Sieve2
  def initialize(target)
    numbers = [*(2..target)]
    sieve = ->(prime) { numbers -= (prime**2..target).step(prime).to_a }
    numbers[0..target**0.5-2].each{|p| sieve[p]}
    numbers
  end
end

class Sieve3
  def initialize(target)
    numbers = [*(2..target)]
    filter = ->(prime) { numbers -= (prime**2..target).step(prime).to_a }
    sieve = ->(n) { n.each { |p| filter[p] } }
    sieve[numbers[0..target**0.5-2]]
    numbers
  end
end

class Sieve4
  def initialize(target)
    numbers = *(2..target)
    remove = ->(e) { numbers.delete e }
    filter = ->(prime) { (prime**2..target).step(prime) { |e| remove[e] } }
    sieve = ->(n) { n.each { |p| filter[p] } }
    sieve[numbers[0..target**0.5-2]]
    numbers
  end
end

class Sieve5
  def initialize(target)
    numbers = *(2..target)
    remove = ->(e) { numbers.delete e }
    filter = ->(prime) { (prime**2..target).step(prime) { |e| remove[e] } }
    sieve = ->(n) { n.each { |p| filter[p] } }
    sieve[numbers]
  end
end

# puts "sieve_1(10) (samebertz: oneliner) - #{sieve_1(10).inspect}"
# puts "sieve_1(50) (samebertz: oneliner) - #{sieve_1(50).inspect}"
# puts "sieve_2(10) (hybrid 1: 1 lambda) - #{sieve_2(10).inspect}"
# puts "sieve_2(50) (hybrid 1: 1 lambda) - #{sieve_2(50).inspect}"
# puts "sieve_3(10) (hybrid 2: Array#- + cap @sqrt) - #{sieve_3(10).inspect}"
# puts "sieve_3(50) (hybrid 2: Array#- + cap @sqrt) - #{sieve_3(50).inspect}"
# puts "sieve_4(10) (hybrid 3: cap @sqrt) - #{sieve_4(10).inspect}"
# puts "sieve_4(50) (hybrid 3: cap @sqrt) - #{sieve_4(50).inspect}"
# puts "sieve_5(10) (kotp: lambdas) - #{sieve_5(10).inspect}"
# puts "sieve_5(50) (kotp: lambdas) - #{sieve_5(50).inspect}"

require 'benchmark'

n = 1000
m = 1000

Benchmark.bmbm do |x|
  x.report("samebertz: kotp inspired - ") { for i in 1..n; Sieve1.new(m); end }
  x.report("hybrid 1: 1 lambda - ") { for i in 1..n; Sieve2.new(m); end }
  x.report("hybrid 2: Array#- + **0.5 - ") { for i in 1..n; Sieve3.new(m); end }
  # x.report("hybrid 3: **0.5 - ") { for i in 1..n; Sieve4.new(m); end }
  # x.report("kotp: lambdas - ") { for i in 1..n; Sieve5.new(m); end }
end
