# frozen_string_literal: true

class Game
  attr_reader :scores, :frame

  TOTAL_FRAMES = 10
  MAX_POINTS = 10

  def initialize
    @frame = 0
    @scores = []
  end

  def roll(pins)
    raise 'Your game is now complete' if game_over?
    @scores << pins
  end

  def score
    result = 0
    index = 0

    TOTAL_FRAMES.times do
      @frame += 1
      if strike?(index)
        result += last_frame ? bonus(index) : strike(index)
        index += 1
      elsif spare?(index)
        result += last_frame ? bonus(index) : spare(index)
        index += 2
      else
        result += normal_frame(index)
        index += 2
       end
     end
    result
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
    MAX_POINTS + @scores[index + 2]
  end

  def normal_frame(index)
    @scores[index] + @scores[index + 1]
  end

  def bonus(index)
    if strike?(index)
       @frame -= 2
       strike(index)
    else
       spare(index)
    end
  end

  def game_over?
    @scores.count >= 21 || @frame >= TOTAL_FRAMES
  end

   def last_frame
     @frame == TOTAL_FRAMES
   end
end
