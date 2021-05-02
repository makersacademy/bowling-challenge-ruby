class Frame
  attr_reader :knocked_pins, :frame, :frame_id, :frame_score, :strike, :spare

  def initialize
    @frame = {}
  end

  def first_roll(knocked_pins1)
    @knocked_pins = knocked_pins1
    wrong_number
    @frame = { first_roll: knocked_pins1, second_roll: 0 }
    @knocked_pins
  end

  def second_roll(knocked_pins2)
    @knocked_pins += knocked_pins2
    wrong_number
    @frame[:second_roll] = knocked_pins2
    @knocked_pins
  end
  
  def wrong_number
    if @knocked_pins > 10
      raise 'Re-type number, so it is between 0 and 10'
    end
  end
end
