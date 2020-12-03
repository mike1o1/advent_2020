require "benchmark"

SOLVED_DAYS = (1..3).freeze

SOLVED_DAYS.each do |day|
  require_relative "day_#{day}/solution"
end

answer = nil

Benchmark.bm do |benchmark|
  SOLVED_DAYS.each do |day|
    puts "**** Day #{day} ****"
    %w(1 2).each do |problem|
      solution_text = "Problem #{problem}."
      puts solution_text

      input = File.read("day_#{day}/input.txt")
      
      solution = Object.const_get("Day#{day}").new(input)
      benchmark.report do
        answer = solution.send("problem_#{problem}")
      end

      puts "Solution: #{answer}"
      puts
    end
  end
end