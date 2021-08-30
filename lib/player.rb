class Player 
  # needs to keep track of their own frames 

attr_reader :name, :frames, :strike_streak, :spare

  def initialize(name, frames = Hash.new)
    @name = name
    @frames = frames
    @strike_streak = 0
    @spare = false
  end

  def frame
    fail "Game is complete no frames remaining" if @frames.length == 10
    first_bowl = rand(0..10)
    # case strike 
    index = ((@frames.length) + 1).to_s
    return @frames[index] = [10,0] if first_bowl == 10
    remaining_pins = 10 - first_bowl
    second_bowl = rand(0..remaining_pins)
    # case spare 
    # case no spare or strike scored
    @frames[index] = [first_bowl ,second_bowl]
  end

  def total
    tally = 0
    @frames.map do |key, frame|
      # if we get a strike include bonus points 
      if frame[0] == 10 
        bonus = @frames[(key.to_i + 1).to_s]
        tally += bonus.sum + 10 
      # if we get a spare add first bowl to tally
      elsif frame.sum == 10
        bonus = @frames[(key.to_i + 1).to_s]
        tally += (bonus[0] + frame.sum)
      # if no spare procced to add frame score to tally  
      else
        tally += frame.sum
      end 
    end
  tally
  end

end
