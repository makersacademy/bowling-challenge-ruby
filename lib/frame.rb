class Frame
  attr_reader :current_frame

  def initialize
    @current_frame = []
  end

  def add_to_frame(pins)
    @current_frame << pins
  end

  def total
    @current_frame.sum
  end

  def first_roll
    @current_frame[0]
  end

  def spare?
    self.total == 10
  end

  def strike?
    @current_frame.include?(10)
  end

  def add_bonus(pins)
    @current_frame << pins
  end

  def length
    @current_frame.length
  end
end