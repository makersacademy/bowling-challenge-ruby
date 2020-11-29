# frozen_string_literal: true

class Game
  attr_reader :strike_count, :frame, :bonus

  def initialize
    @score = []
    @frame = 0
    @bonus = 0
  end

  def roll(pins)
    raise 'Your game is now complete' if game_over?

    @score << pins
  end

  def score
    result = 0
    index = 0
    10.times do
      if strike?(index)
        result += strike_score(index)
        index += 1
        # strike_bonus if @frame >= 10 && @frame <= 12
      elsif spare?(index)
        result += spare_score(index)
        index += 2
        # spare_bonus if @frame >= 10 && @frame <= 11
      else
        result += frame_score(index)
        index += 2
      end
      @frame += 1
    end
    result
  end

  private

  def game_over?
    @score.count >= 20 || @frame >= 10
  end

  def strike?(index)
    @score[index] == 10
  end

  def spare?(index)
    @score[index] + @score[index + 1] == 10
  end

  def strike_score(index)
    10 + @score[index + 1] + @score[index + 2]
  end

  def spare_score(index)
    @score[index] + @score[index + 1] + @score[index + 2]
  end

  def frame_score(index)
    @score[index] + @score[index + 1]
  end

  # def strike_bonus
  #   10 + @score[index] + @score[index + 1]
  #   @bonus += 1
  # end

  # def spare_bonus
  #   10 + @score[index]
  #   @bonus += 1
  # end
end
