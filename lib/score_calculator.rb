class ScoreCalculator
  def initialize(game)
    @game = game
    @score =[]
  end

  def score_by_frame
    next_index = 1
    game_by_frame = @game.rolls_by_frame

    game_by_frame.each do |rolls|
      if rolls[0] == 10 && next_index < 10
        next_two_scores = game_by_frame[next_index..next_index+1].flatten[0..1].sum
        frame_score = rolls[0] + next_two_scores
      elsif rolls.sum == 10 && next_index < 10
        next_score = game_by_frame[next_index][0]
        frame_score = rolls.sum + next_score 
      else
        frame_score = rolls.sum
      end  
      @score << frame_score
      next_index += 1
    end

    return @score
  end

  def total_score
    @score.sum
  end
  
end