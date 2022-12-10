class ScoreCalculator
  def initialize(game)
    @game = game.rolls_by_frame
    @score =[]
  end

  def score_by_frame
    next_index = 1

    @game.each do |rolls|
      bonus_point = 0
      if rolls[0] == 10 && next_index < 10
        bonus_point = @game[next_index..next_index+1].flatten[0..1].sum
      elsif rolls.sum == 10 && next_index < 10
        bonus_point = @game[next_index][0]
      end  
      @score << (rolls.sum + bonus_point)
      next_index += 1
    end

    return @score
  end

  def total_score
    @score.sum
  end
  
end