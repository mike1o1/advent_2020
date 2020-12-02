class Day2
  attr_accessor :policies

  def initialize(input)
    @policies = read_policies(input)
  end
  
  def problem_1
    count_valid
  end
  
  def problem_2
    count_updated_valid
  end
  
  def count_valid
    @policies.select(&:valid?).length
  end
  
  def count_updated_valid
    @policies.select(&:updated_valid?).length
  end

  private

  def read_policies(input)
    input.split("\n").map do |inputs|
      Policy.new(inputs)
    end
  end

end

class Policy
  attr_accessor :minimum
  attr_accessor :maximum
  attr_accessor :letter
  attr_accessor :password

  def initialize(input)
    parse_input(input)
  end
  
  def valid?
    count_required = password.count(letter)
    
    count_required >= minimum && count_required <= maximum
  end
  
  def updated_valid?
    first_letter = password[minimum - 1]
    second_letter = password[maximum - 1]
    
    return false if first_letter != letter && second_letter != letter
    return false if first_letter == letter && second_letter == letter
    
    true
  end
  
  def invalid?
    !valid?
  end
  
  def to_s
    inspect
  end
  
  def inspect
    "Min: #{@minimum} Max: #{maximum} Letter: #{letter}"
  end

  private

  def parse_input(input)
    policy, @password = input.split(": ")

    @letter = parse_letter(policy)
    @minimum, @maximum = parse_range(policy)
  end

  def parse_letter(policy)
    policy.split(" ")[1]
  end

  def parse_range(policy)
    range = policy.split(" ").first
    range.split("-").map(&:to_i)
  end
end



