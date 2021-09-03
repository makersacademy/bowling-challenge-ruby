class Scorecard 

  attr_reader :frames_completed
  
  def initialize(frames_completed)
    @frames = frames_completed
  end 

  def total 
    tally = 0 
    @frames.knocked_down_pins.each_with_index do |frame, index|
      tally += frame.sum
    end 
  p tally
  end 

  def spare(index)
    @frames.knocked_down_pins[index][0]
  end 

  def strike(index)
    @frames[index].sum
  end 

end 

















# This method wasn't needed but was fun to make
# def frame
#   fail "Game is complete no frames remaining" if @frames.length == 10
#   first_bowl = rand(0..10)
#   # case strike 
#   index = ((@frames.length) + 1)
#   return @frames[index] = [10, 0] if first_bowl == 10
#   remaining_pins = 10 - first_bowl
#   second_bowl = rand(0..remaining_pins)
#   # case spare 
#   # case no spare or strike scored
#   @frames[index] = [first_bowl ,second_bowl]

