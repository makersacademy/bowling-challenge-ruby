class Frame
  attr_reader :frame_no
  attr_accessor :roll_two

  @@log = []

  def initialize(no_pins)
    @frame_no = @@log.length + 1
    @roll_one = no_pins
    @roll_two = nil
    @@log << self
  end

  def self.fallen_pins(no_pins)
    if @@log.empty? || @@log.last.is_complete?
      self.new(no_pins)
    else
      @@log.last.roll_two = no_pins
    end
  end

  def self.current_is_a_strike?
    @@log.last.is_a_strike?
  end

  def self.current_is_a_spare?
    @@log.last.is_a_spare?
  end

  def self.no
    @@log.last.frame_no
  end
 
  def is_complete?
    if @frame_no == 10
      (@roll_two && (@roll_one + @roll_two < 10)) || (@roll_two && @roll_three)
    else
      @roll_two || @roll_one == 10 
    end
  end

  def is_a_strike?
    @roll_one == 10
  end

  def is_a_spare?
    @roll_two && @roll_one + @roll_two == 10 && @roll_one != 10
  end
end