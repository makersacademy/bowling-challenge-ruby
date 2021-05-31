class Game
  FRAME_PINS = 10
  FRAME_ROLLS = 2
  MAX_FRAMES = 10

  attr_reader :total_score, :current_frame, :current_frame_pinfall, :current_frame_rolls

  def initialize
    @total_score = 0
    @current_frame = 1
    @current_frame_pinfall = 0
    @current_frame_rolls = 0
    @roll_multipliers = [1, 1, 1]
  end

  def bowl(pinfall)
    return total_score if current_frame > MAX_FRAMES

    add_pinfall_to_score(pinfall)
    bowl_current_frame(pinfall)
    add_strike_bonus if strike?(pinfall) && (!current_frame == 10 || current_frame_rolls == 1)
    add_spare_bonus if current_frame_spare?(pinfall)
    reset_frame if current_frame_over?
    total_score
  end

  def add_pinfall_to_score(pinfall)
    @total_score += if current_frame_pinfall < FRAME_PINS
                      @roll_multipliers.shift * pinfall
                    else
                      @roll_multipliers.shift * pinfall - pinfall
                    end
    @roll_multipliers.push(1)
  end

  def add_strike_bonus
    @roll_multipliers[0] += 1
    @roll_multipliers[1] += 1
  end

  def add_spare_bonus
    @roll_multipliers[0] += 1
  end

  def strike?(pinfall)
    pinfall == FRAME_PINS
  end

  def bowl_current_frame(pinfall)
    @current_frame_pinfall += pinfall
    @current_frame_rolls += 1
  end

  def current_frame_spare?(pinfall)
    current_frame_pinfall == FRAME_PINS && !strike?(pinfall)
  end

  def current_frame_over?
    if current_frame == MAX_FRAMES
      current_frame_rolls == if current_frame_pinfall < FRAME_PINS
                               FRAME_ROLLS
                             else
                               3
                             end
    else
      current_frame_rolls == FRAME_ROLLS || current_frame_pinfall == FRAME_PINS
    end
  end

  def reset_frame
    @current_frame += 1
    @current_frame_pinfall = 0
    @current_frame_rolls = 0
  end
end
