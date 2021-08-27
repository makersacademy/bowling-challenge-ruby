class Game 
  attr_reader :score, :frame, :frame_results, :frame_scores

  def initialize 
    @score = 0
    @frame = 1
    @frame_score = 0
    @frame_results = [] # Xstrike, \spare, 0-9.
    @frame_scores = []
  end

  def roll(pins)
    if pins == 10 
      @frame_results <<  'X' 
    elsif @frame_score + pins == 10
      @frame_results << [@frame_score, '/'] 
    else
      @frame_score += pins
      if @frame_results.length == 0
        @frame_results << [pins]
      else
        @frame_results.last << pins
      end
    end
  end

  def gameover?
    @frame_scores.length == 10 ? true : false
  end
end
