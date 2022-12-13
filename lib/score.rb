class Score
  def initialize(game)
    @game = game.rolls_by_frame
    @score =[]
    @next_frame = 1
  end

  def score_by_frame
    @game.each do |frame|
      @score << (frame.sum + bonus_points(frame))
      @next_frame += 1
    end

    return @score
  end

  def total_score
    @score.sum
  end

  private

  def bonus_points(frame)
    bonus_points = 0
    strike = frame[0] == 10 && @next_frame < 10
    next_two_rolls = @game[@next_frame..@next_frame+1].flatten[0..1].sum
    spare = frame.sum == 10 && @next_frame < 10
    next_roll = (@game.length) > @next_frame ? @game[@next_frame][0] : 0

    if strike
      bonus_points = next_two_rolls
    elsif spare
      bonus_points = next_roll 
    end

    return bonus_points 
  end
  
end