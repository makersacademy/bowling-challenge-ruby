class ScoreCard
  attr_reader = :game_type

  def initialize(score_count, strike_count)
    @score_count = score_count
    @strike_count = strike_count
  end

  def check_scores
    if @score_count == 0
      @game_type = 'Gutter Game'
    elsif @strike_count == 12
      @game_type = 'Perfect Game'
    end
  end

  def print_scores
    "#{@game_type} Your score was #{@score_count}, with #{@strike_count} strikes"
  end


end