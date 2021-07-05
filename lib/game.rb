
class Game
  attr_reader :game_score, :pins_knocked_down, :frame_count_up, :consec_rolls, :roll_count, :frame_score, :turn


  def initialize
    @game_score = []
    @frame_score = []
    @frame_count = 0
    @consec_rolls = 0
    @roll_count = 0
    @roll_score = 0
  end

  def pins_knocked_down(number)
    if number == 10
      strike
    elsif @frame_score.sum == 10
      spare
    end
    turn_score(number)
  end

  def strike
    turn_score(number)
    'strike'
  end

  def spare
    turn_score(number)
    'spare'
  end

  def turn_score(number)
    @frame_score << number
    @roll_score += number
  end

  def frame_count_up
    @frame_count += 1
  end

  def roll
    @roll_count += 1
    @consec_rolls += 1
    if @roll_count > 2
      frame_count_up
      @roll_count = 0
      @frame_score = 0
      @roll_score = 0
    end
  end

end
