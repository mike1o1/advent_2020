require "minitest/autorun"
require_relative "../day_1/solution"

class Day1Tests < Minitest::Test
  def test_day_1_solution_1
    assert_equal(514579, Day1.problem_1(get_inputs))  
  end
  
  def test_day_1_solution_2
    assert_equal(241861950, Day1.problem_2(get_inputs))
  end
  
  def get_inputs
    "1721\n979\n366\n299\n675\n1456"
  end
  
end