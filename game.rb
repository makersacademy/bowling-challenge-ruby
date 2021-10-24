class Game

  attr_accessor :frame, :frame_number

  def initialize
    @frame = Frame.new
    @frame_number = 0
  end

  def roll(pins)
    if pins < 10
      @frame_number +=1
      @frame.roll_number +=1
      @frame.roll.pins += pins
    else
      'dunno'
    end
  end

  def score
  end
end

class Frame

  attr_accessor :roll, :roll_number

  def initialize
    @roll = Roll.new
    @roll_number = 0
  end

end

class Roll

  attr_accessor :pins

def initialize
  @pins = 0
end

end
