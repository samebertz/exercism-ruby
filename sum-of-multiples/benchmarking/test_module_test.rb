#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'test'

TEST_APPROACHES = {
  naive: ->(n) {
    i = 1
    while i * @factors[0] < n
      @factors.each { |e| @multiples << e * i }
      i += 1
    end
    @multiples & [*(0...n)]
  },
  cached: ->(n) {
    while i * @factors[0] < n
      @factors.each { |e| @multiples << e * @i }
      @i += 1
    end
    @multiples & [*(0...n)]
  }
}

class TestModuleTest < Minitest::Test
  include Test
  def test_default_approach
    evens = Multiples.new(2)
    assert_equal 0 , evens.sum_to(1)
    assert_equal 0 , evens.sum_to(2)
    assert_equal 2 , evens.sum_to(3)
    assert_equal 6 , evens.sum_to(5)
    assert_equal 12, evens.sum_to(8)
    assert_equal 42, evens.sum_to(13)
  end
  def test_add_approach
    Multiples.clear_approaches
    Multiples.add_approach(:naive, &TEST_APPROACHES[:naive])
    assert Multiples.approaches.has_key?(:naive)
    assert Multiples.approaches.has_value?(TEST_APPROACHES[:naive])
    assert_equal Multiples.approaches[:naive], TEST_APPROACHES[:naive]
    evens = Multiples.new(2)
    assert_equal 0 , evens.sum_to_with_approach(1, :naive)
    assert_equal 0 , evens.sum_to_with_approach(2, :naive)
    assert_equal 2 , evens.sum_to_with_approach(3, :naive)
    assert_equal 6 , evens.sum_to_with_approach(5, :naive)
    assert_equal 12, evens.sum_to_with_approach(8, :naive)
    assert_equal 42, evens.sum_to_with_approach(13, :naive)
    Multiples.clear_approaches
  end
  def test_clear_approaches
    Multiples.clear_approaches
    Multiples.add_approach(:naive, &TEST_APPROACHES[:naive])
    assert Multiples.approaches.has_key?(:naive)
    assert Multiples.approaches.has_value?(TEST_APPROACHES[:naive])
    assert_equal Multiples.approaches[:naive], TEST_APPROACHES[:naive]
    Multiples.clear_approaches
    assert_empty Multiples.approaches
  end
  def test_add_approach_multiple
    Multiples.clear_approaches
    Multiples.add_approach(:naive, &TEST_APPROACHES[:naive])
    assert Multiples.approaches.has_key?(:naive)
    assert Multiples.approaches.has_value?(TEST_APPROACHES[:naive])
    assert_equal Multiples.approaches[:naive], TEST_APPROACHES[:naive]
    Multiples.add_approach(:cached, &TEST_APPROACHES[:cached])
    assert Multiples.approaches.has_key?(:cached)
    assert Multiples.approaches.has_value?(TEST_APPROACHES[:cached])
    assert_equal Multiples.approaches[:cached], TEST_APPROACHES[:cached]
    Multiples.clear_approaches
  end
end
