class ScoreCalculator
  def initialize(game)
    @game = game
    @score =[]
  end

  def score_by_frame
    frame_index = 1
    game_by_frame = @game.rolls_by_frame

    game_by_frame.each do |rolls|
      if rolls[0] == 10 && frame_index < 10
        frame_score = rolls[0] + game_by_frame[frame_index..frame_index+1].flatten[0..1].sum
      else
        frame_score = rolls.sum
      end  
      @score << frame_score
      frame_index += 1
    end

    return @score
  end

  def total_score
    @score.sum
  end
  
end