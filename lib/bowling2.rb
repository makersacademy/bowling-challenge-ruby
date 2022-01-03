class Bowling2

  attr_reader :turn, :frame, :total_score, :score

  def initialize
    @turn = 1
    @frame = 1
    @total_score = 0
    @score = []
  end

  def input(pins)
    if check_spare && @turn == 1
      @total_score += pins
    end
    @score << pins
    @total_score += pins
    increase_turn
  end

  def increase_turn
    if @turn == 1
      @turn += 1
    else
      increase_frame
      @turn = 1
    end
  end

  def increase_frame
    raise 'Game Over. 10 Frames completed' unless @frame < 11
    @frame += 1
  end

  def check_spare
    if @frame == 1
      false
    elsif @score[-1] + @score[-2] == 10
      true
    else
      false
    end
  end

end
