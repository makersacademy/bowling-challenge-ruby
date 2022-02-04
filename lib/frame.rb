class Frame
  attr_reader :frame_no, :roll_one
  attr_accessor :roll_two, :roll_three, :bonus

  @@log = []

  def initialize(no_pins)
    @frame_no = @@log.length + 1
    @roll_one = no_pins
    @roll_two = nil
    @roll_three = nil
    @bonus = 0
    @@log << self
  end

  def self.accept_roll?(no_pins)
    if @@log.last&.frame_no == 10
      frame10_valid?(no_pins)
    elsif @@log.empty? || @@log.last.complete?
      no_pins <= 10
    else 
      no_pins + @@log.last.roll_one <= 10
    end
  end

  def self.frame10_valid?(no_pins)
    if @@log.last.complete?
      false
    elsif strike? || spare?
      no_pins <= 10
    else   
      no_pins + @@log.last.roll_one <= 10
    end
  end

  def self.fallen_pins(no_pins)
    if @@log[9]&.roll_two && @@log[9].add_total >= 10
      @@log.last.roll_three = no_pins
    elsif @@log.empty? || @@log.last.complete?
      new(no_pins)
    else
      @@log.last.roll_two = no_pins
    end
  end

  def self.add_bonuses(frames_to_add_bonus, no_pins)
    frames_to_add_bonus.each do |frame_no|
      @@log[frame_no - 1].bonus += no_pins
    end
  end

  def self.frame_totals
    @@log.map { |frame| frame.add_total }
  end

  def self.no
    @@log.last.frame_no
  end

  def self.strike?
    @@log.last.roll_one == 10
  end

  def self.spare?
    @@log.last.roll_two && @@log.last.roll_one + @@log.last.roll_two == 10
  end

  def self.no10_complete?
    @@log.last.frame_no == 10 && @@log.last.complete?
  end

  def complete?
    if @frame_no == 10
      (@roll_two && (@roll_one + @roll_two < 10)) || (@roll_two && @roll_three)
    else
      @roll_two || @roll_one == 10 
    end
  end

  def add_total
    total = @roll_one 
    total += @roll_two if @roll_two 
    total += @roll_three if @roll_three
    total += @bonus if @bonus
  end
end
