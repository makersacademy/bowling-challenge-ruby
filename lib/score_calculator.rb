class ScoreCalculator
  def initialize(game)
    @game = game
    @score =[]
  end

  def score_by_frame
    @game.rolls_by_frame.each do |frame|
      @score << frame.sum
    end

    return @score
  end

  def total_score
    @score.sum
  end
  
end