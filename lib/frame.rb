class Frame
  attr_reader :number

  MAX_FRAMES = 10
  MAX_PINS = 10
  MIN_ROLLS_PER_FRAME = 1
  MAX_ROLLS_PER_FRAME_NORMAL = 2
  MAX_ROLLS_FOR_MAX_FRAMES = 3

  def initialize(number)
    @number = number
    @rolls = []
    @bonus = 0
    @score = 0
    @total_score = 0
  end

  def add_roll(pins)
    rolls << pins
  end

  def add_bonus(bonus)
    @bonus += bonus
  end

  def strike?
    rolls.sum == MAX_PINS && rolls.length == MIN_ROLLS_PER_FRAME
  end

  def spare?
    rolls.sum == MAX_PINS && rolls.length == MAX_ROLLS_PER_FRAME_NORMAL
  end

  def complete?
    if number == MAX_FRAMES
      rolls.length == MAX_ROLLS_FOR_MAX_FRAMES
    else
      strike? || rolls.length == MAX_ROLLS_PER_FRAME_NORMAL
    end
  end

  def first_roll_score
    rolls[0]
  end

  def second_roll_score
    rolls[1]
  end

  def total_score(prior_score)
    @total_score = score + prior_score
  end

  private

  attr_reader :rolls, :bonus

  def score
    rolls.sum + @bonus
  end
end
