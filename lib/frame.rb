class Frame
  attr_reader :score, :rolls, :pins_down

  def initialize(rolls)
    fail 'rolls must be between 1 and 10' if invalid_input(rolls)
    @rolls = rolls
    @pins_down = rolls.sum
  end

  def score
    if rolls.length == 3
      rolls.sum
    else spare? || strike?
      spare? || strike? ? @score : @pins_down
    end
  end

  def strike?
    @rolls == [10]
  end

  def spare?
    @rolls.length == 2 && @rolls.sum == 10
  end

  def add_strike_bonus(frame1, frame2=nil)
    if !frame1.strike?
      if frame1.rolls.length == 3
        puts "we are looking at frame: #{self.rolls}"
        puts "And next one is: #{frame1.rolls}"
        puts "adding on: #{frame1.rolls[0..1]}"
        @score = 10 + frame1.rolls[0..1].sum
      else
        @score = 10 + frame1.rolls.sum
      end
    elsif frame2 == nil
      @score = nil
    else
      @score = 20 + frame2.rolls.first
    end
  end

  def add_spare_bonus(frame)
    @score = 10 + frame.rolls.first
  end

  private

  def invalid_input(rolls)
    return (rolls.first < 0 || rolls.first > 10) ||
          (rolls.last < 0 || rolls.last > 10)
  end
end