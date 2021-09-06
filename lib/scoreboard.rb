class Scoreboard
  attr_reader :score, :last_frame, :roll
  
  attr_accessor :strike_bonus, :spare_bonus

  def initialize(player)
    @player = player
    @score = score_builder
    @rolls = []
    @scores = []
    @r1 = 0
    @r2 = 0
  end

  # def roll(pins)
  #   @rolls << pins
  # end

  # def scoretry 
  #   @rolls.inject(&:+)
  # end
  

  def score_builder
  { @player => { 
      1 => [0, 0],
      2 => [0, 0],
      3 => [0, 0],
      4 => [0, 0],
      5 => [0, 0],
      6 => [0, 0],
      7 => [0, 0],
      8 => [0, 0],
      9 => [0, 0],
      10 => [0, 0]
      }
  }
  end

  def add_roll(frame:, roll:)
    @score[@player][frame] = roll
    @roll_total = roll.inject(&:+)
    @r1 = roll[0]
    @r2 = roll[1]
    # p @r1 + @r2
    if @r1 + @r2 == 10
      spare
    elsif @r1 == 10
      strike
    else
      generate_total
    end

    
  end

def spare
  @scores = @score[@player].values
  result = []
  @scores.each_with_index do |score, index|
    next_score = @scores[index+1][0]
    if score == 10
      result << (score[0] += score[1] += next_score)
    end
  end
p result
end

def generate_total
    
    # result = []
    # for strike/spare too vague!
  
    # end
    # result.inject(&:+)
end

end