class Day3
  attr_accessor :input
  
  
  def initialize(input)
    @input = input.split("\n")
  end
  
  def problem_1
    traverse_slope(3, 1)
  end
  
  def slope_right
    3
  end
  
  def slope_down
    1
  end
  
  def problem_2
    total_trees = 1
    [[1,1], [3,1], [5,1], [7,1], [1,2]].map do | right, down |
      total_trees *= traverse_slope(right, down)
    end
    
    total_trees
  end
  
  def traverse_slope(right, down)
    x = 0
    y = 0
    tree_count = 0
    
    (input.length - 1).times do 
      x += right
      y += down
      
      line = input[y]
      
      next if line.nil?
      
      if x >= line.length
        x = x - line.length
      end
      
      tree_count += 1 if line[x] == "#"
    end
    
    tree_count
  end
end