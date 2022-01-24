class Frame
  attr_reader :frame_no
  attr_accessor :roll_two, :bonus

  @@log = []

  def self.log
    @@log
  end

  def initialize(no_pins)
    @frame_no = @@log.length + 1
    @roll_one = no_pins
    @roll_two = nil
    @roll_three = nil
    @bonus = 0
    @@log << self
  end

  def self.fallen_pins(no_pins)
    if @@log.empty? || @@log.last.complete?
      new(no_pins)
    else
      @@log.last.roll_two = no_pins
    end
  end

  def self.current_is_a_strike?
    @@log.last.a_strike?
  end

  def self.current_is_a_spare?
    @@log.last.a_spare?
  end

  def self.no
    @@log.last.frame_no
  end

  def self.add_bonuses(frames_to_add_bonus, no_pins)
    frames_to_add_bonus.each do |frame_no|
      @@log[frame_no - 1].bonus += no_pins
    end
  end

  def self.calculate_score
    @@log.map { |frame| frame.add_total }.sum
  end

  def complete?
    if @frame_no == 10
      (@roll_two && (@roll_one + @roll_two < 10)) || (@roll_two && @roll_three)
    else
      @roll_two || @roll_one == 10 
    end
  end

  def a_strike?
    @roll_one == 10
  end

  def a_spare?
    @roll_two && @roll_one + @roll_two == 10 && @roll_one != 10
  end

  def add_total
    total = @roll_one 
    total += @roll_two if @roll_two 
    total += @roll_three if @roll_three
    total += @bonus if @bonus
  end
end
