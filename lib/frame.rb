class Frame

  attr_reader :current_frame

  def initialize()
    @current_frame = []
  end

  def add_to_frame(pins)
   @current_frame << pins
  end

  def total
   @current_frame.sum
  end
  
  def strike
    @current_frame.include?(10)
  end

  def spare
    total == 10
  end

  def length_of_spare
    @current_frame.length_of_spare
  end
end