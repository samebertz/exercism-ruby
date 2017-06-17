#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'benchmark_module_framework'

TEST_BLOCKS = {
  ary_to_s: ->(*str) {str.to_s},
  ary_inspect: ->(*str) {str.inspect}
}

class BenchmarkFrameworkModuleTest < Minitest::Test
  include BenchmarkModule
  def setup
    @framework = Framework.new
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

  def test_set_blocks
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
end
