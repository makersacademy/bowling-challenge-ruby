class Rules

  MAXIMUM_FRAMES = 10
  MAXIMUM_PINS = 10
  
  attr_accessor :frames, :pins
  
  def initialize
    @frames = MAXIMUM_FRAMES
    @pins = MAXIMUM_PINS
  end
end