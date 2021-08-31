class Player 
  # needs to keep track of their own frames 

  attr_reader :name, :frames

  def initialize(name, frames = Hash.new)
    @name = name
    @frames = frames
  end

  def total
    tally = []
    @frames.map do |key, frame|
      # When we score a double 
      if (@frames[key] == @frames[key+1]) && (frame == [10, 0])
        score = 20 + @frames[key+2].sum 
        tally << score
      # if we get a strike include bonus points 
      elsif frame == [10, 0] 
        bonus = @frames[(key + 1)]
        tally << (bonus.sum + 10) 
      # if we get a spare add first bowl to tally
      elsif frame.sum == 10
        bonus = @frames[(key + 1)]
        tally << (bonus[0] + frame.sum)
      # if no spare procced to add frame score to tally  
      else
        tally << frame.sum
      end 
    end
  p tally
  tally.sum
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

