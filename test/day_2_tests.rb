require "minitest/autorun"
require "minitest/focus"
require_relative "../day_2/solution"

class Day2Tests < Minitest::Test
  def setup
    @solution = Day2.new(get_inputs)
  end
  
  def test_day_2_solution_1
    assert_equal(2, @solution.problem_1)
  end
  
  def test_day_2_solution_2
    assert_equal(1, @solution.problem_2)
  end
  
  def get_inputs
    File.read(File.join(File.dirname(__FILE__), "../day_2/sample_input.txt"))
  end
end