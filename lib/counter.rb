class Counter 
  def initialize 
    @count = 0
  end 

  def adding_up_points(num)
    @count += num 
  end 

  def report_points
    "You have scored #{@count} points so far"
  end 
end 