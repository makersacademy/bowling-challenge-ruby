class Bowling
  attr_reader :rolls, :frames
  
  def initialize
    @rolls = []
    @frames = []
  end

  def roll(pins)
    # @rolls << pins
    if @rolls.length == 2
      @first_Score = @rolls.first
      @last_Score = @rolls.last
      @frames << (@first_Score + @last_Score)
      @rolls = []
      @rolls << pins
    else
      @rolls << pins
    end
  end 

  def score
    total = (@frames.sum + @rolls.sum)
  end
end
