class Game
  FRAME_PINS = 10
  FRAME_ROLLS = 2
  STRIKE_BONUS_ROLLS = 2
  SPARE_BONUS_ROLLS = 1
  BONUS_MULTIPLIER = 2

  attr_reader :total_pinfall, :bonus_rolls, :current_frame_pinfall, :current_frame_rolls

  def initialize
    @total_pinfall = 0
    @bonus_rolls = 0
    @current_frame_pinfall = 0
    @current_frame_rolls = 0
  end

  def bowl(pinfall)
    add_pinfall(pinfall)
    bowl_current_frame(pinfall)
    @bonus_rolls += STRIKE_BONUS_ROLLS if strike?(pinfall)
    @bonus_rolls += SPARE_BONUS_ROLLS if current_frame_spare?(pinfall)
    reset_frame if current_frame_over?
    total_pinfall
  end

  def add_pinfall(pinfall)
    if bonus_rolls?
      @bonus_rolls -= 1
      @total_pinfall += BONUS_MULTIPLIER * pinfall
    else
      @total_pinfall += pinfall
    end
  end

  def bonus_rolls?
    bonus_rolls.positive?
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
    @current_frame_rolls == FRAME_ROLLS
  end

  def reset_frame
    @current_frame_pinfall = 0
    @current_frame_rolls = 0
  end
end
