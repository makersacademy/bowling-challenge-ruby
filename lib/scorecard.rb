class Scorecard

attr_reader :frames, :total_score, :bonus_points

  def initialize(frames = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]])
    @frames = frames # Array.new(10) {Array.new(2,0)}
    @bonus_points = 0 # this will store the bonus points resulting each frame from stikes or spares through the roll_score method
  end

  def strike?(frame: ) # input an element within @frames i.e. frame: @frames[0] or @frames[1]
    p frame[0]
    true if frame[0] == 10
  end

  def spare?(frame: ) 
    frame[0] != 10 && frame.sum == 10 
  end

  # def bonus_points
  #   @frames.each_with_index do |frame, index|
  #     if frame.strike? # assuming frame is instance of Frame class
  #       if @frames[index + 1].strike? 
  #         @frames[index + 1].sum
  #       else 
  #         bonus = @frames[index]
  #     elsif frame.spare?
      
  #     end

  # end

  def outcome 
    if frame_scores == 0  
      'gutter game'
    elsif frame_scores == 300
      'perfect game'
    else
      'your score is #{total_score}'
    end
  end

  #private 
  def total_score
    @score.sum
  end
end
p s = Scorecard.new([[4, 5], [3, 2], [3, 1], [2, 1], [4, 4], [10, 0], [2, 0], [10, 0], [4, 0], [0, 0]])
p f = s.frames[5]
p s.strike?(frame: f)
# p s= Scorecard.new
# p s.roll_score(10,0) #strike. #returns @score array
# p s.bonus_points #should be 0
# p s.frame_scores #returns a value
# p s.roll_score(5,2) #returns @score array
# p s.bonus_points #should be 7
# p s.roll_score(4,6) #spare
# p s.bonus_points
# p s.roll_score(8,1)
# p s.bonus_points #should be 7+8 = 15 


# frames = [
#   [0,1]
#   [2,3] etc. i.e. array of 10 2-element arrays
# ]


# perfect game 
# [10,0]  
# [10,0]
# [10,0]
# [10,0]
# [10,0]
# [10,0]
# [10,0]
# [10,0]
# [10,0]
# [10,0]
# [10,0]
# [10,0]

# [30,0]
# [30,0]
# [30,0]
# [30,0]
# [30,0]
# [30,0]
# [30,0]
# [30,0]
# [30,0]
# [10,0]
# [10,0]
# [10,0]