require "minitest/autorun"
require_relative "../day_6/solution"

class Day6Tests < Minitest::Test
  def setup
    @solution = Day6.new(get_inputs)
  end
  
  def test_day_6_solution_1
    assert_equal(11, @solution.problem_1)
  end
  
  def test_day_6_solution_2
    assert_equal(3, Day6.new("abc").problem_2)
    
    assert_equal(6, @solution.problem_2)
  end

  def get_inputs
    File.read(File.join(File.dirname(__FILE__), "../day_6/sample_input.txt"))
  end
end