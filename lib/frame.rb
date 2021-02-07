
class Frame 
  attr_reader :score, :frame_number
  def initialize(frame_number)
    @frame_number = frame_number
    @score = []
  end 

  def add_roll(pins)
    raise 'Frame complete' if frame_over?
    @score << pins 
  end 


  private

  def frame_over?
    @score[0] == 10
  end 
end 