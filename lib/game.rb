class Game 
  # needs to store player instances 
  # needs to calculate bonus points to add to score 
  
  def frame
    arr = []
    x = rand(1..10)
    arr << x
    y = 10 - x
    arr << rand(1..y)
  end

end 

# strike = [10,0]
# spare = [x,y] in which (x+y) == 10 
# standard_frames = [x,y] in which (x + y) < 10 
