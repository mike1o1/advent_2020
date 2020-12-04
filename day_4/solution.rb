class Day4
  attr_accessor :input

  def initialize(input)
    @input = read_passports(input)

  end

  def problem_1
    valid_passports = 0
    input.each do |passport|
      valid_passports += 1 if passport.valid? 
    end
    
    valid_passports
  end

  def problem_2
    valid_passports = 0
    input.each do |passport|
      valid_passports += 1 if passport.strict_valid?
    end
    
    valid_passports
  end

  private

  def read_passports(input)
    input.split(/\n{2,}/).map do |passport|
      Passport.new(passport)
    end
  end
end

class Passport
  attr_accessor :fields

  def initialize(input)
    @fields = input.sub("\n", " ").split(" ").map do |pair|
      ValuePair.new(pair)
    end
  end

  def valid?
    missing_fields = 0
    required_fields.each do |req_field|
      found_field = fields.find do |f|
        f.field_name == req_field
      end
      
      if found_field.nil?
        missing_fields += 1
      end
    end
    
    missing_fields == 0
  end
  
  def strict_valid?
    return false unless valid?
    
    byr_valid? && iyr_valid? && eyr_valid? &&
      hgt_valid? && hcl_valid? && ecl_valid? &&
      pid_valid?
  end

  def byr
    @byr ||= fields.find {|f| f.field_name == "byr"}
  end
  
  def byr_valid?
    return false if byr.nil? || byr.value.length != 4
    value = byr.value.to_i
    
    value >= 1920 && value <= 2002
  end
  
  def iyr
    @iyr ||= fields.find {|f| f.field_name == "iyr"}
  end
  
  def iyr_valid?
    return false if iyr.nil? || iyr.value.length != 4
    value = iyr.value.to_i
    value >= 2010 && value <= 2020
  end

  def eyr
    @eyr ||= fields.find {|f| f.field_name == "eyr"}
  end
  
  def eyr_valid?
    return false if eyr.nil? || eyr.value.length != 4
    value = eyr.value.to_i
    value >= 2020 && value <= 2030
  end

  def hgt
    @hgt ||= fields.find {|f| f.field_name == "hgt"}
  end
  
  def hgt_valid?
    return false if hgt.nil?
    
    value = hgt.value
    
    return false unless value.include?("in") || value.include?("cm")
    
    if value.include?("in")
      height = value.sub("in", "").to_i
      height >= 59 && height <= 76
    else
      height = value.sub("cm", "").to_i
      height >= 150 && height <= 193
    end
  end

  def hcl
    @hcl ||= fields.find {|f| f.field_name == "hcl"}
  end
  
  def hcl_valid?
    return false if hcl.nil? || hcl.value.length != 7
    
    value = hcl.value
    
    return false if value[0] != "#"
    
    color = value.sub("#", "")
    
    color.match?(/^[[:xdigit:]]+$/)
  end

  def ecl
    @ecl ||= fields.find {|f| f.field_name == "ecl"}
  end
  
  def ecl_valid?
    return false if ecl.nil?
    
    valid_ecls = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
    
    valid_ecls.include?(ecl.value)
  end

  def pid
    @pid ||= fields.find {|f| f.field_name == "pid"}
  end
  
  def pid_valid?
    return false if pid.nil?
    
    pid.value.length == 9
  end

  def cid
    @cid ||= fields.find {|f| f.field_name == "cid"}
  end

  def required_fields
    ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
  end
end

class ValuePair
  attr_accessor :field_name
  attr_accessor :value

  def initialize(input)
    @field_name, @value = input.split(":")
  end

  def to_s
    "Field: #{field_name} Value: #{value}"
  end
end