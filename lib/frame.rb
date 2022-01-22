class Frame
  def initialize
    @score = []
    @roll_count = 0
  end

  def roll(pins)
    fail "You only get two rolls per frame (unless on the 10th round)" unless @roll_count < 2
    fail "You can't add more pins" unless @score.sum + pins <= 10 
    @roll_count += 1
    @score << pins
  end

  def total
    @score.inject(0){|sum,x| sum+x} 
  end 


end