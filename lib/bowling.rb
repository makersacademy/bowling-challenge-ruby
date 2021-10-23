class Bowling
  MAX_PINS = 10
  MAX_ROUNDS = 10
  attr_reader :rolls, :frame, :score, :turn

  def initialize
    @rolls = []
    @frame = 0
    @score = 0
    @turn = 1
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    loop do
      if spare?(@frame)
        spare
      elsif strike?(@frame)
        strike
      else
        sum_points
      end
      @turn += 1
      final_round(@frame) if turn == MAX_ROUNDS
      break if gameover
    end
    @score
  end

  private

  def final_round(frame)
    if @rolls[frame] < MAX_PINS
      no_bonus(frame)
    else
      bonus(frame)
    end
  end
  
  def strike?(frame)
    @rolls[frame] == MAX_PINS
  end

  def strike
    @score += strike_points
    @frame += 1
  end
  
  def strike_points
    MAX_PINS + @rolls[@frame + 1] + @rolls[@frame + 2]
  end

  def spare
    @score += spare_points
    @frame += 2
  end

  def spare?(frame)
    @rolls[frame] + @rolls[frame + 1] == MAX_PINS
  end

  def spare_points
    MAX_PINS + @rolls[@frame + 2]
  end

  def sum_points
    @score += sum_of_frame(@frame)
    @frame += 2
  end

  def sum_of_frame(frame)
    @rolls[frame] + @rolls[frame + 1]
  end

  def gameover
    @frame >= @rolls.length
  end

  def no_bonus(frame)
    @score += @rolls[frame] + @rolls[frame + 1]
    @frame += 2
  end

  def bonus(frame)
    @score += @rolls[frame] + @rolls[frame + 1] + @rolls[frame + 2]
    @frame += 3
  end

end
