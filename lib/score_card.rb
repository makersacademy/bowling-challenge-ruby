class ScoreCard

  attr_reader :frames

  def initialize
    @frames = []
  end

  def roll(user_input)
    if @frames.length == 0 || @frames.last.rolls.length == 2 || @frames.last.is_strike?
      frame = Frame.new
      @frames << frame
    else 
      frame = @frames.last
    end
    frame.roll(user_input)
  end 
end