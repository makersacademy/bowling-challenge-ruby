class Player 
  # needs to keep track of their own frames 

attr_reader :name, :frames, :strike_streak, :spare

  def initialize(name, frames = Array.new)
    @name = name
    @frames = frames
    @strike_streak = 0
    @spare = false
  end

  def frame
    fail "Game is complete no frames remaining" if @frames.length == 10
    first_bowl = rand(0..10)
    # case strike 
    return @frames << [10, 0] if first_bowl == 10
    remaining_pins = 10 - first_bowl
    second_bowl = rand(0..remaining_pins)
    # case spare 
    # case no spare or strike scored
    @frames << [first_bowl, second_bowl]
  end

  def total
    tally = 0
    @strike_streak = 0
    @frames.each do |frame| 
      tally += frame.sum if @strike_streak > 0
      tally += frame[0] if @spare
      if frame[0] == 10
        tally += 10
        @spare = false 
        @strike_streak += 1 
      elsif frame.sum == 10
        tally += 10
        @spare = true
        @strike_streak = 0
      else 
        tally += frame.sum 
        @spare = false
        @strike_streak = 0
      end
    end 
  tally
  end

end
