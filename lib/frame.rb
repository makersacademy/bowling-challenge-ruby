
# BOWLING RULES
# each game consits of 10 frames
# for each frame
  # add number of knocked down pins
  # determine strike or spare
    # if spare
      # mark as spare? - have a Frame object?
      # or simply add the first throw from the next round?
    # if strike
      # add the next two throws (could be 2 strikes)


# PROGRAM
  # user inputs the scores?
    # should the user be able to input the scores each at a time?
    # should the user input all the scores at once?

# First build a frame object:
  # attributes:
    # strike?
    # spare?
  
    # {
    #   1: [5, 6], 
    #   2: [10, 0], 
    #   3: [10, 0], 
    #   4: [10, 0], 
    #   5: [5, 5],
    #   6: [5, 6],
    #   7: [0, 0],
    #   8: [0, 0],
    #   9: [5, 5]
    #   10: [10, 0] + 5 + 5
    # }

class Frame

  attr_accessor :score, :bonus_throws

  def initialize(throw_1, throw_2 = nil)
    @throw_1 = throw_1
    @throw_2 = throw_2
    @score = determine_score
    @bonus_throws = bonus_throws?
  end
  
  def add_points(points)
    @score += points
  end
  
  private
  def bonus_throws?
    strike? ? 2 : spare? ? 1 : 0
  end

  def determine_score
    strike? ? @throw_1 : @throw_1 + @throw_2
  end

  def strike?
    @throw_2.nil?
  end

  def spare?
    strike? ? false : @throw_1 + @throw_2 == 10
  end
end
