class Frame
  attr_reader :current_frame
  def initialize
    @current_frame = []
  end

  def add_to_frame(pins)
    @current_frame << pins
  end

  def total
    self.current_frame.sum
  end

  def first_roll
    self.current_frame[0]
  end

  def spare?
    self.total == 10
  end

  def strike?
    self.current_frame.include?(10)
  end

  def add_bonus(pins)
    self.current_frame.push(pins)
  end

  def length 
    self.current_frame.length
  end

  def bonus_frame?
    self.current_frame.length == 3
  end

end