class Day6
  attr_accessor :groups

  def initialize(input)
    @groups = input.split("\n\n")
  end

  def problem_1
    groups.map { |group| get_group_answers(group).count }.reduce(:+)
  end

  def problem_2
    groups.map { |group| get_agreed_group_answers(group)}.reduce(:+)

    # get_agreed_group_answers(groups[0])
  end

  def get_group_answers(group)
    group_answers = group.split("\n").map do |person|
      person.split("")
    end

    group_answers.flatten.uniq
  end

  def get_agreed_group_answers(group)
    # iterate through the group to find the unique group answers
    # then go through each person in the group to see if they answered yes
    answer_counts = {}

    people = group.split("\n")

    distinct_answers = get_group_answers(group)
    distinct_answers.each do |answer|
      answer_counts[answer] = 0

      people.each do |person|
        answer_counts[answer] += 1 if person.include?(answer)
      end
    end

    count = 0
    answer_counts.each do |answer, answer_count|
      count += 1 if answer_count == people.length
    end

    count
  end
end