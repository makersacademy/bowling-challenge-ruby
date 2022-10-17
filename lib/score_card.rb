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
      if frame.strike? && frame != last_bonus_game
        if @frames[i + 1].strike? && @frames[i + 1] != last_bonus_game
          score += bonus_score_perfectgame(frame, i)
        else
          score += bonus_score_strike(frame, i)
        end
      elsif frame.spare? && frame != last_bonus_game
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

  def bonus_score_strike(frame, i)
    frame.first_roll + @frames[i + 1].score
  end

  def bonus_score_perfectgame(frame, i)
    frame.score + @frames[i + 1].score + @frames.last.score
  end  
end