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

  def strike?
    self.current_frame.include?(10)
  end

  def spare?
    self.total == 10
  end

  def game_over
    self.current_frame.length == 21
  end

end
