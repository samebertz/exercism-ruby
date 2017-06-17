#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'benchmark_time_module'

TEST_BLOCKS = {
  ary_to_s: ->(*str) {str.to_s},
  ary_inspect: ->(*str) {str.inspect}
}

class BenchmarkTimeModuleTest < Minitest::Test
  include BenchmarkModule
  def test_time_method
    benchmark = Measure.new(TEST_BLOCKS)
    time_results = benchmark.time_method(:ary_to_s)
    assert time_results.has_key?(:ary_to_s)
    assert time_results[:ary_to_s].instance_of?(Benchmark::Tms)
    assert_equal time_results[:ary_to_s].label, :ary_to_s.to_s
  end
  def test_time_method_with_args
    benchmark = Measure.new(TEST_BLOCKS)
    time_results = benchmark.time_method(:ary_to_s, args="test")
    assert time_results.has_key?(:ary_to_s)
    assert time_results[:ary_to_s].instance_of?(Benchmark::Tms)
    assert_equal time_results[:ary_to_s].label, :ary_to_s.to_s
  end
  def test_time_method_with_tests
    benchmark = Measure.new(TEST_BLOCKS)
    time_results = benchmark.time_method(:ary_to_s, tests=10_000)
    assert time_results.has_key?(:ary_to_s)
    assert time_results[:ary_to_s].instance_of?(Benchmark::Tms)
    assert_equal time_results[:ary_to_s].label, :ary_to_s.to_s
  end
  def test_time_method_with_args_and_tests
    benchmark = Measure.new(TEST_BLOCKS)
    time_results = benchmark.time_method(:ary_to_s, tests=10_000)
    assert time_results.has_key?(:ary_to_s)
    assert time_results[:ary_to_s].instance_of?(Benchmark::Tms)
    assert_equal time_results[:ary_to_s].label, :ary_to_s.to_s
    time_results = benchmark.time_method(:ary_to_s, args=["test"], tests=10_000)
    assert time_results.has_key?(:ary_to_s)
    assert time_results[:ary_to_s].instance_of?(Benchmark::Tms)
    assert_equal time_results[:ary_to_s].label, :ary_to_s.to_s
  end
  def test_time_all
    benchmark = Measure.new(TEST_BLOCKS)
    time_results = benchmark.time_all
    TEST_BLOCKS.each_key do |block_name|
      assert time_results.has_key?(block_name)
      assert time_results[block_name].instance_of?(Benchmark::Tms)
      assert_equal time_results[block_name].label, block_name.to_s
    end
  end
end
