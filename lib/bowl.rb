class Bowl

  attr_reader :rolls, :score, :frame 

  def initialise
    rolls = []
    score = 0
    frame = 1
  end


  TOTAL_FRAMES = 10

  def roll_one

    roll_result = [0,1,2,3,4,5,6,7,8,9,10].sample
    score += roll_result
    frame += 1 if is_strike
    strike = true if is_strike

  end

  def roll_two 
    roll_result = [0,1,2,3,4,5,6,7,8,9,10].sample
    score += roll_result
    frame += 1 

  end










  private

  def is_strike
    roll_result == 10
  end





end