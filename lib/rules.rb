module Rules

  MAXIMUM_FRAMES = 10
  MAXIMUM_PINS = 10
  
  attr_accessor :frames, :pins
  
  def self.frames
    MAXIMUM_FRAMES
  end

  def self.pins
    MAXIMUM_PINS
  end 

  def self.strike(first_throw)
    first_throw == 10
  end

  def self.spare(first_throw, second_throw)
    first_throw + second_throw == 10
  end


end