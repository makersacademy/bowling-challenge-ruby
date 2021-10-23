class Bowling
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    @frame = 0
    @score = 0
    turn = 1
    loop do
      if strike?(@frame)
        @score += 10 + @rolls[@frame + 1] + @rolls[@frame + 2]
        @frame += 1
      elsif spare?(@frame)
        @score += 10 + @rolls[@frame + 2]
        @frame += 2
      else
        @score += sum_of_frame(@frame)
        @frame += 2
      end
      turn += 1
      bonus_round(@frame) if turn == 10
      break if @frame >= @rolls.length
    end
    @score
  end

  def bonus_round(frame)
    if @rolls[frame] < 10
      @score += @rolls[frame] + @rolls[frame + 1]
      @frame += 2
    else
      @score += @rolls[frame] + @rolls[frame + 1] + @rolls[frame + 2]
      @frame += 3
    end
  end
  
  private
  
  def strike?(frame)
    @rolls[frame] == 10
  end

  def spare?(frame)
    @rolls[frame] + @rolls[frame + 1] == 10
  end

  def sum_of_frame(frame)
    @rolls[frame] + @rolls[frame + 1]
  end

end
