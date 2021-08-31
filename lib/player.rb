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
    index = ((@frames.length) + 1)
    return @frames[index] = [10, 0] if first_bowl == 10
    remaining_pins = 10 - first_bowl
    second_bowl = rand(0..remaining_pins)
    # case spare 
    # case no spare or strike scored
    @frames[index] = [first_bowl ,second_bowl]
  end

  def total
    tally = []
    @frames.map do |key, frame|
      # When a turkey or more is scored 
      if false
        p "WE HAVE A TURKEY"
      # When we score a double 
      elsif (@frames[key] == @frames[key+1]) && (frame == [10, 0])
        score = 20 + @frames[key+2].sum 
        tally << score
      # if we get a strike include bonus points 
      elsif frame[0] == 10 
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
