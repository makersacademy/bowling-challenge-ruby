class Scorecard

attr_reader :total_score, :bonus_points

  def initialize
    @score = [] #Array.new(10) {Array.new(2,0)}
    @bonus_points = 0 #this will store the bonus points resulting each frame from stikes or spares through the roll_score method
  end

  # def frame_score
  #   n = 1
  #   while 0 < n <= 9 
  #     n + 1
  #   end
  #   # final frame code here?
  # end

  def frame_scores # 
    total = @score.map{ |frame| frame.sum }.sum #map returns a new array with the results. sum 
    total += @bonus_points
  end

  def roll_score(a = 0, b = 0) 
    frame = [a, b]
    if @score.length > 1
      if @score[-1][0] == 10 && @score[-2][0] == 10 #access the previous frame's first roll score to check if strike 
        @bonus_points += (a+b+10)
      elsif @score[-1][0] == 10
        @bonus_points += (a+b)
      elsif @score[-1].sum == 10
        @bonus_points += a
      end
    end
    p @score << frame
    p @bonus_points
  end

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