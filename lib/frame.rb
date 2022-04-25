class Frame
  attr_reader :type
  attr_accessor :first_roll, :second_roll, :third_roll, :score

  def initialize(last = false)
    @first_roll = 0
    @second_roll = 0
    @third_roll = 0
    @score = 0
    @last = last
  end

  def base_score
    result = @first_roll
    if !last? && !strike?
      result += @second_roll
    end
    result
  end

  def apply_score
    @score += base_score
  end

  def apply_bonus(frame)
    @score += bonus(frame)
  end

  def last?
    @last
  end

  def strike?
    @first_roll == 10
  end

  def open?
    @first_roll + @second_roll < 10
  end

  def third_roll?
    last? && !open?
  end

  def second_roll?
    !strike? || last?
  end

  private

  def spare?
    !strike? && (@first_roll + @second_roll == 10)
  end

  def bonus(frame)
    result = 0
    if spare? || strike?
      result += frame.first_roll
    end
    if strike?
      result += frame.second_roll
    end

    if frame.last?
      result += frame.third_roll
    end
    result
  end
end
