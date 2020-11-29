# frozen_string_literal: true

class Game
  attr_accessor :score, :frame

  TP = 10
  TF = 10
  def initialize
    @score = []
    @frame = 0
  end

  def roll(pins)
    raise 'Your game is now complete' if game_over?

    @score << pins
  end

  def score
    result = 0
    index = 0
    10.times do
      @frame += 1
      if strike?(index)
        result += last_frame ? bonus(index) : strike_score(index)
        index += 1
      elsif spare?(index)
        result += last_frame ? bonus(index) : spare_score(index)
        index += 2
      else
        result += frame_score(index)
        index += 2
      end
    end
    result
  end

  private

  def game_over?
    @score.count >= 21 || @frame >= TF
  end

  def strike?(index)
    @score[index] == TP
  end

  def spare?(index)
    @score[index] + @score[index + 1] == TP
  end

  def strike_score(index)
    TP + @score[index + 1] + @score[index + 2]
  end

  def spare_score(index)
    @score[index] + @score[index + 1] + @score[index + 2]
  end

  def frame_score(index)
    @score[index] + @score[index + 1]
  end

  def bonus(index)
    if strike?(index)
      @frame -= 2
      strike_score(index)
    else
      spare_score(index)
    end
  end

  def last_frame(frame = @frame)
    frame == TF
  end
end
