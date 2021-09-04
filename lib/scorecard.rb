class Scorecard 

  attr_reader :frames
  
  def initialize(frames)
    @frames = frames
  end 

  def total 
    tally = 0 
    @frames.each_with_index do |frame, index|
      if frame.spare
        tally += bonus_for_spare(frame, index)
      else
      end 
      tally += frame.knocked_down_pins.sum
    end 
  tally
  end 

  def bonus_for_spare(frame, index)
    return 0 if @frames[index+1].nil?
    return @frames[index+1].knocked_down_pins[0] 
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

