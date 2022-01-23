class Scorecard

attr_reader :frames

  def initialize(frames = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]])
    @frames = frames # Array.new(10) {Array.new(2,0)}
  end

  def bonus(num) # gives bonus points per particular frame when given frame index as an argument      
    return 0 if num > 8 
      if num == 8
        frame = @frames[num]
        next_frame = @frames[num+1]
        if strike?(frame: frame) && strike?(frame: next_frame)
          return 10 + next_frame[1]
        elsif strike?(frame: frame)
          return next_frame[0] + next_frame[1]
        end
      end  

    frame = @frames[num]
    next_frame = @frames[num+1]
    next_next_frame = @frames[num+2] 
    if strike?(frame: frame) && strike?(frame: next_frame)
      10 + next_next_frame[0]
    elsif strike?(frame: frame)
      next_frame[0] + next_frame[1] # don't use sum because if 10th frame has three entries, it will sum all 3 if 9th is strike
    elsif spare?(frame: frame)
      next_frame[0]
    else 
      0
    end
  end

  def frame_scores
    scores = []
    @frames.each_with_index do |frame, idx|
      scores << frame.sum + bonus(idx)
    end
    scores
  end

  def perfect_game? 
    @frames == [[10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 10, 10]]
  end  

  def gutter_game? 
    @frames == [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]]
  end  

  def total_score 
    frame_scores.sum
  end
 
  def strike?(frame: ) # input an element within @frames i.e. frame: @frames[0] or @frames[1]
    frame[0] == 10
  end

  def spare?(frame: ) 
    frame[0] != 10 && frame.sum == 10 
  end
end
 p s = Scorecard.new([[4, 5], [3, 2], [3, 1], [2, 8], [4, 4], [10, 0], [2, 0], [10, 0], [10, 0], [10, 10, 3]])
# p f = s.frames[5]
# p s.strike?(frame: f)
# p perfect = Scorecard.new([[10, 0], [10, 0], [0, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 10, 10]])
# p perfect.perfect_game?
# p perfect.bonus(3) #should be 20. yes
# p perfect.bonus(1) #0. yes
# p s.bonus(5) #2
# p s.bonus(3) #4
# p s2 = Scorecard.new([[4, 5], [3, 2], [3, 1], [2, 8], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]])
# p s2.frame_scores
p s.frame_scores 
p s.bonus(8)
p s.bonus(9)

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


# perfect game scores with bonuses: 

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