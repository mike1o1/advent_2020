class Day3
  attr_accessor :input
  
  
  def initialize(input)
    @input = input.split("\n")
  end
  
  def problem_1
    x = 0
    y = 0
    tree_count = 0
    
    (input.length - 1).times do 
      x += slope_right
      y += slope_down

      line = input[y]

      # See if we've gone past the memory and wrap the x position
      if x >= line.length
        x = x - line.length
      end
      
      if line[x] == "#"
        tree_count += 1
      end
    end
    
    tree_count
  end
  
  def slope_right
    3
  end
  
  def slope_down
    1
  end
  
  def problem_2
    
  end
end