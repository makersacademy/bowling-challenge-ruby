class Game
  def initialize(rolls)
    @rolls = rolls
  end

  def score
    score = 0
    @rolls.each_with_index do |frame, i|
      score += frame_score(frame, i)
    end
    score
  end

  private

  def frame_score(frame, index)
    return 0 if index > 9                                    # don't count the bonus on their own
    frame_score = frame.inject(0,:+)
    frame_score += strike_or_spare(frame, index) if frame_score == 10 # if a strike or spare
    frame_score
  end

  def strike_or_spare(frame, index)
    if frame.length == 1                                    # if a strike
      strike_score(index)
    else                                                    # if a spare
      @rolls[index + 1][0]
    end
  end

  def strike_score(index)
    if @rolls[index + 1].length == 1                         # if consecutive strikes
      @rolls[index + 1][0] + @rolls[index + 2][0]
    else                                                     # if just one strike
      @rolls[index + 1].inject(0,:+)
    end
  end
end
