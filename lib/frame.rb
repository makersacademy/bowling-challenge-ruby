class Frame

  attr_reader :currentscore
  def initialize
    @currentscore = 0
    @ball_number = 1
  end

  def roll(value)
    if @ball_number == 1
      @currentscore += value
      @ball_number += 1
    elsif @ball_number == 2
      @currentscore += value
      @ball_number = 1
    end
  end
end
