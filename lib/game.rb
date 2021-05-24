# frozen_string_literal: true

require 'frame'

class Game
  attr_reader :frame, :scores

  TP = 10
  TF = 10
  def initialize
    @scores = []
    @frame = 0
  end

  def roll(pins)
    raise 'Your game is now complete' if game_over?

    @scores << pins
  end

  def score
    result = 0
    index = 0
    TF.times do
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
    @scores.count >= 21 || @frame >= TF
  end

  def strike?(index)
    @scores[index] == TP
  end

  def spare?(index)
    @scores[index] + @scores[index + 1] == TP
  end

  def strike_score(index)
    TP + @scores[index + 1] + @scores[index + 2]
  end

  def spare_score(index)
    @scores[index] + @scores[index + 1] + @scores[index + 2]
  end

  def frame_score(index)
    @scores[index] + @scores[index + 1]
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
