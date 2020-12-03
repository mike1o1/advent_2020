require "rake/testtask"

Rake::TestTask.new do |t|
  t.test_files = FileList["test/**/*.rb"]
end
desc "Run tests"

task :main do
  require_relative("main")
end

task default: :main

task :day, [:day] do |t, args|
  day = args[:day]
  
  require_relative "day_#{day}/solution"
  
  puts "Day #{day}"
  input = File.read("day_#{day}/input.txt")
  
  solution = Object.const_get("Day#{day}").new(input)
  
  puts "Problem 1"
  puts solution.problem_1
  
  puts
  
  puts "Problem 2"
  puts solution.problem_2
end