require "minitest/autorun"
require_relative "../day_1/solution"

class Day1Tests < Minitest::Test
  def setup
    @solution = Day1.new(get_inputs)
  end

  def test_day_1_solution_1
    assert_equal(514579, @solution.problem_1)
  end

  def test_day_1_solution_2
    assert_equal(241861950, @solution.problem_2)
  end

  def get_inputs
    "1721\n979\n366\n299\n675\n1456"
  end

end