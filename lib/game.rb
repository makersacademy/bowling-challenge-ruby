class Game
  attr_reader :total_pinfall, :bonus_rolls

  def initialize
    @total_pinfall = 0
    @bonus_rolls = 0
  end

  def bowl(pinfall)
    if bonus_rolls?
      @bonus_rolls -= 1
      @total_pinfall += 2 * pinfall
    else
      @total_pinfall += pinfall
    end
    @bonus_rolls += 2 if strike?(pinfall)
    total_pinfall
  end

  def bonus_rolls?
    bonus_rolls.positive?
  end

  def strike?(pinfall)
    pinfall == 10
  end
end
