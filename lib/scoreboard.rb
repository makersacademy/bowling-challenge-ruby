class Scoreboard

  attr_reader :frame, :roll, :knocked_down_pins, :total_score

  def initialize(frame:, roll:, knocked_down_pins:, total_score:)
    @frame = frame
    @roll = roll
    @knocked_down_pins = knocked_down_pins
    @total_score = total_score 
  end


  def self.create(frame:, roll:, knocked_down_pins:, total_score:)
    Scoreboard.new(frame: 0, 
    roll: 0, 
    knocked_down_pins: 0, 
    total_score: 0
    ) 
  end 


end