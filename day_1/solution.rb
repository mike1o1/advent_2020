module Day1
  def self.problem_1(input)
    entries = entries(input)
    first = nil
    second = nil

    # iterate through each entry and sum the others until
    # we get to 2020
    entries.each do |entry|
      entries.each do |second_entry|
        if entry + second_entry == 2020
          first = entry
          second = second_entry
        end
      end
    end

    first * second
  end

  def self.problem_2(input)
    entries = entries(input)

    first = nil
    second = nil
    third = nil

    entries.each do |entry|
      entries.each_with_index do |second_entry|
        entries.each_with_index do |third_entry|
          if entry + second_entry + third_entry == 2020
            first = entry
            second = second_entry
            third = third_entry
          end
        end
      end
    end

    first * second * third
  end

  def self.entries(input)
    input.split("\n").map(&:to_i)
  end
end