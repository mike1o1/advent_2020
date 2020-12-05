require "minitest/autorun"
require "minitest/focus"
require_relative "../day_5/solution"

class Day5Tests < Minitest::Test
  def setup
    @solution = Day5.new(get_inputs)
  end

  def test_day_5_solution_1_basics
    sample = "BFFFBBFRRR"
    assert_equal(70, @solution.find_row(sample))

    assert_equal(7, @solution.find_seat(sample))

    assert_equal(567, @solution.seat_id(sample))
  end

  def test_day_5_solution_1
    assert_equal(820, @solution.problem_1)
  end

  def get_inputs
    File.read(File.join(File.dirname(__FILE__), "../day_5/sample_input.txt"))
  end
end