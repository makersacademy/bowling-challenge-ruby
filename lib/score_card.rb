class ScoreCard
  def initialize
    @frames = []
  end

  def add(frame)
    @frames << frame
  end

  def all
    @frames
  end

  def total_score
    score = 0
    @frames.each_with_index do |frame, i|
      if frame.spare? && frame != last_bonus_game
        score += bonus_score_spare(frame, i)
      elsif !frame.spare? && frame != last_bonus_game
      score += frame.score
      end
    end
    return score
  end

  def last_bonus_game
    if @frames.size == 11
      @frames.last
    end
  end
  
  private

  def bonus_score_spare(frame, i)
    frame.score + @frames[i + 1].first_roll
  end
end