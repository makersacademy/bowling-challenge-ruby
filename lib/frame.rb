class Frame 
  GUTTER = '- Gutter'
  STRIKE = 'X Strike'
  SPARE = '/ Spare'
  MAX_PINS = 10 
  MAX_BOWLS = 2

  attr_accessor :bowls, :pins 

  def initialize
    @bowls = []
    @pins = MAX_PINS
  end 

  def bowl(hits)
    remaining_pins = @pins - hits
    raise "Error, please enter a valid number of hits" if hits > MAX_PINS || remaining_pins < 0
    @pins = remaining_pins
    @bowls << hits 
  end 

  def first_turn
    bowls.first 
  end 

  def second_turn
    bowls[1]
  end 

  def bonus? 
    score == MAX_PINS
  end 

  def score
    s = 0
    bowls.each do |bowl| s += bowl end 
    s 
  end 

  def strike? 
    first_turn == MAX_PINS
  end 

  def spare? 
    !strike? && bonus?
  end 

  def gutter? 
    score == 0 && bowls.length == 2
  end 

  def complete? 
    @pins == 0 || bowls.length == 2 
  end 

  def statement
    if strike? 
      STRIKE
    elsif spare? 
      SPARE
    else 
      GUTTER
    end 
  end 
end 




