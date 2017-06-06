require_relative "test"
include Test
Test::register_approaches

require "benchmark"

TESTS = 5_000
SUM_TO = 100

Benchmark.bmbm do |results|
  Multiples.approaches.each_key do |k|
    evens = Multiples.new(2)
    results.report(k.to_s + ": ") do
      for i in 0..TESTS
        sum_to = i % SUM_TO
        evens.sum_to_with_approach(sum_to, k)
      end
    end
  end
end
