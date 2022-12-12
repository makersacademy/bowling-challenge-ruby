# frozen_string_literal: true

class BowlingGame
  def initialize(io = Kernel, rolls = [])
    @rolls = rolls
    @current_roll_index = 0
    @io = io
  end

  def roll(pins_knocked_down)
    @rolls << pins_knocked_down
  end

  def score
    total_score = 0
    frame_num = 1
    10.times do
      if strike?
        total_score += 10 + strike_bonus
        next_frame_after_strike
      elsif spare?
        total_score += 10 + spare_bonus
        next_frame
      else
        total_score += frame_total
        next_frame
      end
      @io.puts "Score after Frame #{frame_num}: #{total_score}"
      frame_num += 1
    end
    total_score
  end

  private

  def strike?
    @rolls[@current_roll_index] == 10
  end

  def spare?
    @rolls[@current_roll_index] + @rolls[@current_roll_index + 1] == 10
  end

  def strike_bonus
    @rolls[@current_roll_index + 1] + @rolls[@current_roll_index + 2]
  end

  def spare_bonus
    @rolls[@current_roll_index + 2]
  end

  def frame_total
    @rolls[@current_roll_index] + @rolls[@current_roll_index + 1]
  end

  def next_frame_after_strike
    @current_roll_index += 1
  end

  def next_frame 
    @current_roll_index += 2
  end
end

# game = BowlingGame.new
# game.input_score_for_frames
