class Day6
  attr_accessor :groups

  def initialize(input)
    @groups = input.split("\n\n")
  end

  def problem_1
    groups.map { |group| get_group_answer(group) }.reduce(:+)
  end
  
  def problem_2
    
  end

  def get_group_answer(group)
    group_answers = group.split("\n").map do |person|
      person.split("")
    end

    group_answers.flatten.uniq.count
  end
end