class Game 
  attr_reader :score, :frame, :frame_results, :frame_scores

  def initialize 
    @score = 0
    @frame = 1
    @frame_results = [] # Xstrike, \spare, 0-9.
    @frame_scores = []
  end

  def roll(pins)
    if pins == 10
      @frame += 1
      @frame_results << 'X'
    end
  end

  def gameover?
    @frame_scores.length == 10 ? true : false
  end
end
