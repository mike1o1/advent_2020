require "minitest/autorun"
require "minitest/focus"
require_relative "../day_3/solution"

class Day3Tests < Minitest::Test
  def setup
    @solution = Day3.new(get_inputs)
  end

  def test_day_3_solution_1
    assert_equal(7, @solution.problem_1)
  end

  def test_day_3_solution_2
    assert_equal(336, @solution.problem_2)
  end

  def get_inputs
    File.read(File.join(File.dirname(__FILE__), "../day_3/sample_input.txt"))
  end
end