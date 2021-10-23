class Frame
  attr_reader :bonus, :pins

  def initialize
    @pins = []
    @bonus = 0
    @total = 0
  end

  def add(pins)
    @pins << pins
  end

  def strike?
    @pins.first == 10
  end

  def spare?
    @pins.first < 10 && @pins.sum == 10
  end

  def calculate_bonus
    @bonus = 0 unless strike? || spare?
    @bonus = 1 if spare?
    @bonus = 2 if strike?
  end

  def active_bonus?
    @bonus > 0
  end

  def deduct_bonus
    @bonus -= 1
  end

  def total
    @total = @pins.sum # + bonus
  end

  def complete?
    (@pins.count == 2 || strike?)
  end

end
