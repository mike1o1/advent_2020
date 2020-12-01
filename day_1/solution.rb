class Day1
  attr_accessor :input
  
  def initialize(input)
    @input = read_entries(input)
  end
  
  def problem_1
    first = nil
    second = nil
    
    input.each do |entry|
      input.each do |second_entry|
        if entry + second_entry == 2020
          first = entry
          second = second_entry
        end
      end
    end
    
    first * second
  end
  
  def problem_2
    first = nil
    second = nil
    third = nil

    input.each do |entry|
      input.each do |second_entry|
        input.each do |third_entry|
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

  private
  
  def read_entries(input)
    input.split("\n").map(&:to_i)
  end
end