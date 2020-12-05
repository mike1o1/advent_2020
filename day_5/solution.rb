class Day5
  attr_accessor :passes

  SEATS = 0..7
  ROWS = 0..127

  def initialize(input)
    @passes = input.split("\n")
  end

  def problem_1
    passes.map { |pass| seat_id(pass) }.max
  end

  def problem_2
    sorted_seats = passes.filter { |pass| !back_row?(pass) && !front_row?(pass) }
                         .map { |pass| seat_id(pass) }
                         .to_a
                         .sort

    my_seat = 0
    sorted_seats.each_with_index do |seat, index|
      next if index == sorted_seats.length - 1

      diff = sorted_seats[index + 1] - seat

      if diff > 1
        my_seat = seat + 1
      end
    end
    
    my_seat
    

  end

  def seat_id(pass)
    row = find_row(pass)
    seat = find_seat(pass)

    row * 8 + seat
  end

  def find_row(pass)
    range = ROWS.to_a

    pass[0..6].split("").each do |letter|
      case letter
      when "F"
        range = range.slice(0, range.count / 2)
      when "B"
        range = range.slice(range.count / 2, range.count)
      end
    end

    range[0]
  end

  def find_seat(pass)
    range = SEATS.to_a

    pass[7..9].split("").each do |letter|
      case letter
      when "L"
        range = range.slice(0, range.count / 2)
      when "R"
        range = range.slice(range.count / 2, range.count)
      end
    end

    range[0]
  end

  def front_row?(pass)
    pass[0..6] == "F" * 7
  end

  def back_row?(pass)
    pass[0..6] == "B" * 7
  end
end