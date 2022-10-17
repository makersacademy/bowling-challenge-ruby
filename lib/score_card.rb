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
    @frames.each do |frame|
      score += frame.score
    end
    return score
  end

  def last_bonus_game?
    if @frames.size == 11
      @frames.last
    end
  end

  def bonus_score_strike
  end

  def bonus_score_spare
  end
end