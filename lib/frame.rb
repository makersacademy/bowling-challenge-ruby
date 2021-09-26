require_relative './player'

class Frame

  def initialize(frame_number)
    @frame_number = frame_number
    @remaining_pins = 10
    @first_roll_score = 0
    @second_roll_score = 0
    @total = 0
  end

  attr_reader :frame_number, :remaining_pins, :first_roll_score, :second_roll_score
  attr_accessor :total

  def strike?
    @first_roll_score == 10
  end

  def spare?
    @first_roll_score + @second_roll_score == 10 && @first_roll_score != 10
  end

end