# frozen_string_literal: true

class Game
  attr_reader :scores, :frame, :balls

  TOTAL_FRAMES = 10
  MAX_POINTS = 10

  def initialize
    @balls = 0
    @frame = 0
    @scores = []
  end

  def roll(pins)
    raise score if game_over?
    @scores << pins
    balls_rolled(pins)
  end

  def score
    result = 0
    index = 0

    TOTAL_FRAMES.times do
      if strike?(index)
        result += strike(index)
        index +=1
      elsif spare?(index)
        result += spare(index)
        index += 2
      else
        result += normal_frame(index)
        index += 2
      end
    end
    "Game over you scored #{result}"
  end

  private

  def strike?(index)
    @scores[index] == MAX_POINTS
  end

  def strike(index)
    MAX_POINTS + @scores[index + 1] + @scores[index + 2]
  end

  def spare?(index)
    @scores[index] + @scores[index + 1] == MAX_POINTS
  end

  def spare(index)
    @scores[index] + @scores[index + 1] + @scores[index + 2]
  end

  def normal_frame(index)
    @scores[index] + @scores[index + 1]
  end

  def game_over?
    @balls >= 20
  end

  def balls_rolled(pins)
    pins == MAX_POINTS ? @balls += 2 : @balls +=1
  end
end
