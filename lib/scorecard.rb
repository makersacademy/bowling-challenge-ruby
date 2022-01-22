class Scorecard

attr_reader :total_score

  def initialize
    @score = [] #Array.new(10) {Array.new(2,0)}
  end

  # def frame_score
  #   n = 1
  #   while 0 < n <= 9 
  #     n + 1
  #   end
  #   # final frame code here?
  # end

  def frame_scores
    @score.map{ |frame| frame.sum }.sum #map returns a new array with the results

  end

  def roll_score(a = 0, b = 0) 
    frame = [a, b]
    @score << frame
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


# frames = [
#   [0,1]
#   [2,3] etc. i.e. array of 10 2-element arrays
# ]