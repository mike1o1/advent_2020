require "benchmark"

SOLVED_DAYS = (1..1).freeze

SOLVED_DAYS.each do |day|
  require_relative "day_#{day}/solution"
end

solution = nil

Benchmark.bm do |benchmark|
  SOLVED_DAYS.each do |day|
    puts "**** Day #{day} ****"
    %w(1 2).each do |problem|
      solution_text = "Problem #{problem}."
      puts solution_text

      klass = Object.const_get("Day#{day}")
      benchmark.report do
        input = File.read("day_#{day}/input.txt")
        solution = klass.send("problem_#{problem}", input)
      end

      puts "Solution: #{solution}"
      puts
    end
  end
end