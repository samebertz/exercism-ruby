#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'benchmark_module'

TEST_BLOCKS = {
  ary_to_s: ->(*str) {str.to_s},
  ary_inspect: ->(*str) {str.inspect}
}

class BenchmarkModuleTest < Minitest::Test
  include BenchmarkModule
  def setup
    @framework = Framework.new()
  end

  def test_add_method
    @framework.add_method(:ary_to_s, &TEST_BLOCKS[:ary_to_s])
    assert @framework.blocks.has_key?(:ary_to_s)
    assert @framework.blocks.has_value?(TEST_BLOCKS[:ary_to_s])
    assert_equal @framework.blocks[:ary_to_s], TEST_BLOCKS[:ary_to_s]
  end

  def test_clear_methods
    @framework.add_method(:ary_to_s, &TEST_BLOCKS[:ary_to_s])
    @framework.clear_methods
    assert_empty @framework.blocks
  end

  def test_set_methods
    @framework.clear_methods
    @framework.blocks = TEST_BLOCKS
    TEST_BLOCKS.each_pair do |name, method|
      assert @framework.blocks.has_key?(name)
      assert @framework.blocks.has_value?(method)
      assert_equal @framework.blocks[name], method
    end
  end

  def test_use_method
    @framework.add_method(:ary_to_s, &TEST_BLOCKS[:ary_to_s])
    assert_equal "[\"test\"]", @framework.use_method(:ary_to_s, "test")
    @framework.add_method(:ary_inspect, &TEST_BLOCKS[:ary_inspect])
    assert_equal "[\"test\"]", @framework.use_method(:ary_inspect, "test")
  end

  def test_time_method
    benchmark = Measure.new(TEST_BLOCKS)
    time_results = benchmark.time_method(:ary_to_s)
    assert time_results.has_key?(:ary_to_s)
    assert time_results[:ary_to_s].instance_of?(Benchmark::Tms)
    assert_equal time_results[:ary_to_s].label, :ary_to_s.to_s
  end

  def test_time_method_with_args
    benchmark = Measure.new(TEST_BLOCKS)
    time_results = benchmark.time_method(:ary_to_s, "test")
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
    time_results = benchmark.time_method(:ary_to_s, "test", 10_000)
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
