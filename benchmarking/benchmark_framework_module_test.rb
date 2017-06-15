#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'benchmark_framework_module'

TEST_BLOCKS = {
  ary_to_s: ->(*str) {str.to_s},
  ary_inspect: ->(*str) {str.inspect}
}

class BenchmarkFrameworkModuleTest < Minitest::Test
  include BenchmarkFrameworkModule
  def test_add_method
    BenchmarkFramework.add_method(:ary_to_s,
                                  &TEST_BLOCKS[:ary_to_s])

    assert BenchmarkFramework.blocks.has_key?(:ary_to_s)
    assert BenchmarkFramework.blocks.has_value?(TEST_BLOCKS[:ary_to_s])
    assert_equal BenchmarkFramework.blocks[:ary_to_s],
                 TEST_BLOCKS[:ary_to_s]
  end

  def test_clear_methods
    BenchmarkFramework.add_method(:ary_to_s,
                                  &TEST_BLOCKS[:ary_to_s])
    BenchmarkFramework.clear_methods

    assert_empty BenchmarkFramework.blocks
  end

  def test_set_methods
    BenchmarkFramework.clear_methods
    BenchmarkFramework.set_methods(TEST_BLOCKS)

    TEST_BLOCKS.each_pair do |name, method|
      assert BenchmarkFramework.blocks.has_key?(name)
      assert BenchmarkFramework.blocks.has_value?(method)
      assert_equal BenchmarkFramework.blocks[name], method
    end
  end

  def test_use_method
    BenchmarkFramework.add_method(:ary_to_s,
                                  &TEST_BLOCKS[:ary_to_s])
    assert_equal "[\"test\"]", BenchmarkFramework.use_method(:ary_to_s, "test")
    BenchmarkFramework.add_method(:ary_inspect,
                                  &TEST_BLOCKS[:ary_inspect])
    assert_equal "[\"test\"]", BenchmarkFramework.use_method(:ary_inspect, "test")
  end
end
