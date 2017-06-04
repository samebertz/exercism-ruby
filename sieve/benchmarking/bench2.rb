def sieve_0(n)
  [*(2..n)].tap{|a|a[0..n**0.5-2].map{|e|a.reject!{|c|c>e&&c%e==0}}}
end

def sieve_1(n)
  (primes=[*(2..n)])[0..n**0.5-2].map{|e|primes-=(e**2..n).step(e).to_a}[-1]
end

def sieve_2(target)
  numbers = [*(2..target)]
  sieve = ->(prime) { numbers -= (prime**2..target).step(prime).to_a }
  numbers[0..target**0.5-2].each{|p| sieve[p]}
  numbers
end

def sieve_3(target)
  numbers = [*(2..target)]
  filter = ->(prime) { numbers -= (prime**2..target).step(prime).to_a }
  sieve = ->(n) { n.each { |p| filter[p] } }
  sieve[numbers[0..target**0.5-2]]
  numbers
end

def sieve_4(target)
  numbers = *(2..target)
  remove = ->(e) { numbers.delete e }
  filter = ->(prime) { (prime**2..target).step(prime) { |e| remove[e] } }
  sieve = ->(n) { n.each { |p| filter[p] } }
  sieve[numbers[0..target**0.5-2]]
  numbers
end

def sieve_5(target)
  numbers = *(2..target)
  remove = ->(e) { numbers.delete e }
  filter = ->(prime) { (prime**2..target).step(prime) { |e| remove[e] } }
  sieve = ->(n) { n.each { |p| filter[p] } }
  sieve[numbers]
end

# puts "sieve_0(10) (samebertz: reject!) - #{sieve_0(10).inspect}"
# puts "sieve_0(50) (samebertz: reject!) - #{sieve_0(50).inspect}"
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
m = 100000

Benchmark.bmbm do |x|
  x.report("samebertz: reject! - ") { sieve_0(m); }
  x.report("samebertz: kotp inspired - ") { sieve_1(m); }
  x.report("kotp mod 3: 1 lambda - ") { sieve_2(m); }
  x.report("kotp mod 2: Array#- + cap @sqrt - ") { sieve_3(m); }
  x.report("kotp mod 1: cap @sqrt - ") { sieve_4(m); }
  x.report("kotp: lambdas - ") { sieve_5(m); }
end
